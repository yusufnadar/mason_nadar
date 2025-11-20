import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../view/home_view.dart';

mixin HomeMixin on State<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), FlutterNativeSplash.remove);
  }
}
