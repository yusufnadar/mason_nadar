import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  obfuscate: true,
  path: 'assets/env/.env'
)
abstract class Env {
  @EnviedField(varName: 'IOS_PURCHASE_ID')
  static String iosPurchaseId = _Env.iosPurchaseId;
  @EnviedField(varName: 'ANDROID_PURCHASE_ID')
  static String androidPurchaseId = _Env.androidPurchaseId;
  @EnviedField(varName: 'MIX_PANEL_TOKEN')
  static String mixpanelToken = _Env.mixpanelToken;
}