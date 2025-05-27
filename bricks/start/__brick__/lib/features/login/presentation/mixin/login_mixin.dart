import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import '../view/login_view.dart';
import '../view_model/login_view_model.dart';

mixin LoginMixin on State<LoginView> {
  late LoginViewModel viewModel;

  @override
  void initState() {
    super.initState();
    if (widget.firstOpen == true) {
      Future.delayed(const Duration(milliseconds: 300), FlutterNativeSplash.remove);
    }
    viewModel = context.read<LoginViewModel>();
  }

  void loginWithGoogle() => viewModel.loginWithGoogle();

  void loginWithApple() => viewModel.loginWithApple();
}
