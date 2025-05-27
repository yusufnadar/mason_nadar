import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  obfuscate: true,
  path: 'assets/env/.env'
)
abstract class Env {
  @EnviedField(varName: 'IOS_CLIENT_ID')
  static String iosClientId = _Env.iosClientId;
  @EnviedField(varName: 'WEB_CLIENT_ID')
  static String webClientId = _Env.webClientId;
}