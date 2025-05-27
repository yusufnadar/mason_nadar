import 'package:flutter/material.dart';
import '../mixin/landing_mixin.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> with LandingMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
