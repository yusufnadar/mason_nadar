import 'package:flutter/material.dart';

import '../../../core/consts/enum/event_type.dart';
import '../../../core/consts/local/app_locals.dart';
import '../../../core/consts/route/app_routes.dart';
import '../../../core/services/firebase_analytics/firebase_analytics_service.dart';
import '../../../core/services/get_it/get_it_service.dart';
import '../../../core/services/local/local_service.dart';
import '../../../core/services/route/route_service.dart';
import '../../../core/services/toast/toast_service.dart';
import '../../data_source/user_data_source.dart';
import '../../model/user/user_model.dart';

class UserProvider with ChangeNotifier {
  final UserDataSource _dataSource;
  UserModel? user;

  UserProvider(this._dataSource);

  Future<void> logout({bool? deleteAccount}) async {
    await Future.wait([
      getIt<LocalService>().remove(AppLocals.accessToken),
      getIt<LocalService>().remove(AppLocals.refreshToken),
      getIt<FirebaseAnalyticsService>().setUserId(id: null),
      if (deleteAccount == true)
        getIt<FirebaseAnalyticsService>().logEvent(event: EventType.deleteAccount)
      else
        getIt<FirebaseAnalyticsService>().logEvent(event: EventType.logout),
    ]);
    user = null;
    await getIt<RouteService>().goRemoveUntil(path: AppRoutes.login);
  }

  Future<void> deleteAccount() async {
    final res = await _dataSource.deleteAccount();
    res.fold((error) => ToastService.warning(error.message), (response) => logout(deleteAccount: true));
  }

  Future<UserModel?> getUser() async {
    final res = await _dataSource.getUser();
    return res.fold(
      (error) {
        ToastService.warning(error.message);
        getIt<RouteService>().go(path: AppRoutes.login, data: {'firstOpen': true});
        return null;
      },
      (response) {
        user = response;
        notifyListeners();
        return user;
      },
    );
  }
}
