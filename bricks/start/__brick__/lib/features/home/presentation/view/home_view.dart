import 'package:flutter/material.dart';
import '../mixin/home_mixin.dart';

class HomeView extends StatefulWidget {
  final bool? firstOpen;

  const HomeView({super.key, this.firstOpen});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
