import 'package:flutter/material.dart';

import '../../../../common/provider/user/user_provider.dart';
import '../../../../core/consts/local/app_locals.dart';
import '../../../../core/consts/route/app_routes.dart';
import '../../../../core/services/get_it/get_it_service.dart';
import '../../../../core/services/route/route_service.dart';
import '../../../../core/services/storage/storage_service.dart';
import '../view/landing_view.dart';

mixin LandingMixin on State<LandingView> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  Future<void> checkUser() async {
    final routeService = getIt<RouteService>();
    final storageService = getIt<StorageService>();
    if (await storageService.read(AppLocals.accessToken) != null) {
      await getIt<UserProvider>().getUser();
      await routeService.goRemoveUntil(path: AppRoutes.home);
    } else {
      await Future.delayed(const Duration(milliseconds: 300));

      await storageService.write(AppLocals.firstOpen, true);
      await routeService.goRemoveUntil(path: AppRoutes.onboarding);
    }
  }
}
