import 'package:get_it/get_it.dart';
import '../../../common/data_source/user_data_source.dart';
import '../../../common/provider/user/user_provider.dart';
import '../../../features/home/data/data_source/home_data_source.dart';
import '../../../features/home/presentation/view_model/home_view_model.dart';
import '../../../features/onboarding/presentation/view_model/onboarding_view_model.dart';
import '../../../features/subscriptions/presentation/view_model/subscriptions_view_model.dart';
import '../network/network_service.dart';
import '../route/route_service.dart';
import '../storage/storage_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<StorageService>(StorageService());
  getIt.registerSingleton<NetworkService>(NetworkService()).init();
  getIt.registerSingleton<RouteService>(RouteService());
  getIt.registerSingleton<UserProvider>(UserProvider(UserDataSource(getIt<NetworkService>())));
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel(HomeDataSource(getIt<NetworkService>())));
  getIt.registerFactory<OnboardingViewModel>(() => OnboardingViewModel());
  getIt.registerFactory<SubscriptionsViewModel>(() => SubscriptionsViewModel());
}
