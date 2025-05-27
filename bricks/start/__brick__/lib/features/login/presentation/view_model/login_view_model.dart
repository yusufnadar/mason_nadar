import 'package:flutter/material.dart';

import '../../../../common/provider/user/user_provider.dart';
import '../../../../core/consts/enum/event_type.dart';
import '../../../../core/consts/local/app_locals.dart';
import '../../../../core/consts/route/app_routes.dart';
import '../../../../core/services/firebase_analytics/firebase_analytics_service.dart';
import '../../../../core/services/get_it/get_it_service.dart';
import '../../../../core/services/local/local_service.dart';
import '../../../../core/services/route/route_service.dart';
import '../../../../core/services/toast/toast_service.dart';
import '../../data/data_source/login_data_source.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginDataSource _dataSource;

  LoginViewModel(this._dataSource);

  Future<void> loginWithGoogle() async {
    final res = await _dataSource.loginWithGoogle();
    if (res == null) return;
    res.fold((error) {
      ToastService.warning(error.message);
    }, (response) async {
      await getIt<LocalService>().write(AppLocals.accessToken, response.accessToken);
      await getIt<LocalService>().write(AppLocals.refreshToken, response.refreshToken);
      await getIt<UserProvider>().getUser();
      await getIt<FirebaseAnalyticsService>().logEvent(event: EventType.googleLogin);
      await getIt<FirebaseAnalyticsService>().setUserId(id: getIt<UserProvider>().user?.id);
      ToastService.success('Login successful');
      await getIt<RouteService>().goRemoveUntil(path: AppRoutes.home);
    });
  }

  Future<void> loginWithApple() async {
    final res = await _dataSource.loginWithApple();
    if (res == null) return;
    res.fold((error) {
      ToastService.warning(error.message);
    }, (response) async {
      await getIt<LocalService>().write(AppLocals.accessToken, response.accessToken);
      await getIt<LocalService>().write(AppLocals.refreshToken, response.refreshToken);
      await getIt<UserProvider>().getUser();
      await getIt<FirebaseAnalyticsService>().logEvent(event: EventType.appleLogin);
      await getIt<FirebaseAnalyticsService>().setUserId(id: getIt<UserProvider>().user?.id);
      ToastService.success('Login successful');
      await getIt<RouteService>().goRemoveUntil(path: AppRoutes.home);
    });
  }
}
