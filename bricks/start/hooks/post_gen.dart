import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');
  await Future.wait(
    [
      Process.run(
        'flutter',
        [
          'pub',
          'add',
          'get_it',
          'cached_network_image',
          'url_launcher',
          'uuid',
          'toastification',
          'share_plus',
          'clipboard',
          'flutter_secure_storage',
          'dio',
          'flutter_native_splash:2.4.0',
          'dartz',
          'flutter_svg',
          'flutter_screenutil',
          'logger',
          'provider',
          'mixpanel_flutter',
          'purchases_ui_flutter:9.1.0',
          'purchases_flutter:9.1.0',
          'envied',
          'upgrader',
          'sign_in_with_apple',
          'google_sign_in',
          'in_app_review',
        ],
      ),
      Process.run(
        'flutter',
        [
          'pub',
          'add',
          '--dev',
          'build_runner',
          'flutter_gen_runner',
          'envied_generator',
          'flutter_launcher_icons',
        ],
      ),
    ],
  );
  progress.complete();
  final progress2 = context.logger.progress('Flutter Gen and Native Splash creating');
  await addFlutterGenAndNativeSplash();
  progress2.complete();

  final progress3 = context.logger.progress('Pub Get and Build Runner working');
  await Process.run('flutter', ['pub', 'get']);
  await Process.run('dart', ['run', 'build_runner', 'build']);
  progress3.complete();
}

Future<void> addFlutterGenAndNativeSplash() async {
  final file = File('pubspec.yaml');

  if (!await file.exists()) {
    print('pubspec.yaml not found.');
    return;
  }

  String content = await file.readAsString();

  if (content.contains('flutter_gen:')) {
    print('flutter_gen already added.');
    return;
  }

  final config = '''
flutter_gen:
  output: lib/core/consts/gen/
  integrations:
    flutter_svg: true
    lottie: true

flutter_native_splash:
  color: "#058071"
  image: assets/images/logo.png
  android: true
  ios: true
  android_12:
    color: "#058071"
    image: assets/images/logo.png
    
flutter_launcher_icons:
  android: true
  ios: true
  image_path_ios: "assets/images/logo.png"
  image_path_android: "assets/images/logo.png"
  adaptive_icon_foreground: "assets/images/logo.png"
  min_sdk_android: 21
  remove_alpha_ios: true
  adaptive_icon_background: "#ffffff"
''';

  // Dosyanın sonuna ekle
  content += '\n$config';

  await file.writeAsString(content);
}
