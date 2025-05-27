import 'package:flutter/material.dart';
import '../../../../common/widget/custom_upgrade_alert.dart';
import '../../../../core/consts/color/app_colors.dart';
import '../mixin/login_mixin.dart';

class LoginView extends StatefulWidget {
  final bool? firstOpen;

  const LoginView({super.key, this.firstOpen});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return CustomUpgradeAlert(child: Scaffold(backgroundColor: AppColors.primary));
  }
}
