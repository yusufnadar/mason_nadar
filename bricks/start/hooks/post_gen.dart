import 'dart:io';

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
          'get_storage',
          'dio',
          'flutter_native_splash',
          'dartz',
          'flutter_svg',
          'flutter_screenutil',
          'logger',
          'provider',
          'firebase_analytics',
          'fluttertoast',
          'firebase_core',
          'envied',
          'upgrader',
          'sign_in_with_apple',
          'google_sign_in',
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
''';

  // Dosyanın sonuna ekle
  content += '\n$config';

  await file.writeAsString(content);
}
