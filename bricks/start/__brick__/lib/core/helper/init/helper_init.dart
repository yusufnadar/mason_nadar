import 'env.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../common/provider/user/user_provider.dart';

import '../../services/mix_panel/mix_panel_service.dart';
import '../../services/get_it/get_it_service.dart';
import '../../consts/app/app_constants.dart';
import '../../consts/enum/event_type.dart';
import '../../../main.dart';

class HelperInit {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    setupLocator();
    //await initPurchase();
    await Future.wait([
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
      MixpanelService.init(),
    ]);
  }

  static Future<void> initPurchase() async {
    await Purchases.setLogLevel(LogLevel.error);
    if (Platform.isIOS) {
      await Purchases.configure(PurchasesConfiguration(Env.iosPurchaseId));
    } else {
      await Purchases.configure(PurchasesConfiguration(Env.androidPurchaseId));
    }
    AppConstants.customerInfo = await Purchases.getCustomerInfo();
  }

  static void startApp() {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(create: (context) => getIt<UserProvider>()),
        ],
        child: const MyApp(),
      ),
    );
  }
}
