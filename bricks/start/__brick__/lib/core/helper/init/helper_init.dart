import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import '../../../common/provider/user/user_provider.dart';
import '../../../main.dart';
import '../../services/get_it/get_it_service.dart';
import '../../services/local/local_service.dart';
import '../../services/theme/theme_service.dart';

class HelperInit {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    setupLocator();
    await getIt<LocalService>().init();
  }

  static void startApp() {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeService>(
            create: (context) => getIt<ThemeService>(),
          ),
          ChangeNotifierProvider<UserProvider>(
            create: (context) => getIt<UserProvider>(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}
