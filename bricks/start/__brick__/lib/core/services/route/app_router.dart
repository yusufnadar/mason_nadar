import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../features/home/presentation/view_model/home_view_model.dart';
import '../../../features/landing/presentation/view/landing_view.dart';
import '../../../features/landing/presentation/view_model/landing_view_model.dart';
import '../../../features/login/presentation/view/login_view.dart';
import '../../../features/login/presentation/view_model/login_view_model.dart';
import '../../consts/route/app_routes.dart';
import '../get_it/get_it_service.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.landing:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => getIt<LandingViewModel>(),
            child: const LandingView(),
          ),
          settings: const RouteSettings(name: AppRoutes.landing),
        );
      case AppRoutes.login:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => getIt<LoginViewModel>(),
            child: LoginView(firstOpen: args?['firstOpen']),
          ),
          settings: const RouteSettings(name: AppRoutes.login),
        );
      case AppRoutes.home:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => getIt<HomeViewModel>(),
            child: LoginView(firstOpen: args?['firstOpen']),
          ),
          settings: const RouteSettings(name: AppRoutes.home),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => getIt<LoginViewModel>(),
            child: LoginView(firstOpen: true),
          ),
          settings: const RouteSettings(name: AppRoutes.login),
        );
    }
  }
}
