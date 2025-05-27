import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import '../../../common/data_source/user_data_source.dart';
import '../../../common/provider/user/user_provider.dart';
import '../../../features/login/data/data_source/login_data_source.dart';
import '../../../features/login/presentation/view_model/login_view_model.dart';
import '../firebase_analytics/firebase_analytics_service.dart';
import '../local/local_service.dart';
import '../network/network_service.dart';
import '../route/route_service.dart';
import '../theme/theme_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<LocalService>(LocalService(GetStorage()));
  getIt.registerSingleton<NetworkService>(NetworkService(Dio(), getIt<LocalService>())).init();
  //getIt.registerSingleton<FirebaseAnalyticsService>(FirebaseAnalyticsService(FirebaseAnalytics.instance));
  getIt.registerSingleton<RouteService>(RouteService());
  getIt.registerSingleton<ThemeService>(ThemeService(getIt<LocalService>()));
  getIt.registerSingleton<UserProvider>(UserProvider(UserDataSource(getIt<NetworkService>())));
  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(LoginDataSource(getIt<NetworkService>())));
}
