import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../features/home/presentation/view/home_view.dart';
import '../../../features/home/presentation/view_model/home_view_model.dart';
import '../../../features/landing/presentation/view/landing_view.dart';
import '../../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../../features/onboarding/presentation/view_model/onboarding_view_model.dart';
import '../../../features/subscriptions/presentation/view/subscriptions_view.dart';
import '../../../features/subscriptions/presentation/view_model/subscriptions_view_model.dart';
import '../../consts/route/app_routes.dart';
import '../get_it/get_it_service.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.landing:
        return MaterialPageRoute(
          builder: (context) => const LandingView(),
          settings: const RouteSettings(name: AppRoutes.landing),
        );
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => getIt<OnboardingViewModel>(),
            child: OnboardingView(),
          ),
          settings: const RouteSettings(name: AppRoutes.onboarding),
        );
      case AppRoutes.subscriptions:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => getIt<SubscriptionsViewModel>(),
            child: SubscriptionsView(),
          ),
          settings: const RouteSettings(name: AppRoutes.subscriptions),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => getIt<HomeViewModel>(),
            child: HomeView(),
          ),
          settings: const RouteSettings(name: AppRoutes.home),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const LandingView(),
          settings: const RouteSettings(name: AppRoutes.landing),
        );
    }
  }
}
