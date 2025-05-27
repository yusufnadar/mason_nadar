import 'package:flutter/material.dart';

import '../../../../common/provider/user/user_provider.dart';
import '../../../../core/consts/local/app_locals.dart';
import '../../../../core/consts/route/app_routes.dart';
import '../../../../core/services/get_it/get_it_service.dart';
import '../../../../core/services/local/local_service.dart';
import '../../../../core/services/route/route_service.dart';
import '../view/landing_view.dart';

mixin LandingMixin on State<LandingView> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  Future<void> checkUser() async {
    if (getIt<LocalService>().read(AppLocals.accessToken) != null) {
      final res = await getIt<UserProvider>().getUser();
      if(res != null){
        await getIt<RouteService>().goRemoveUntil(
          path: AppRoutes.home,
          data: {'firstOpen': true},
        );
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 300));
      await getIt<RouteService>().goRemoveUntil(
        path: AppRoutes.login,
        data: {'firstOpen': true},
      );
    }
  }
}
