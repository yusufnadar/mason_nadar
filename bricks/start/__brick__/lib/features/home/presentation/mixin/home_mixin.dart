import 'package:flutter/material.dart';
import '../view/home_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

mixin HomeMixin on State<HomeView> {

  @override
  void initState() {
    super.initState();
    if (widget.firstOpen == true) {
      Future.delayed(const Duration(milliseconds: 300), FlutterNativeSplash.remove);
    }
  }

}
