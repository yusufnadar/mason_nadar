import 'package:flutter/material.dart';
import '../mixin/{{feature_name.snakeCase()}}_mixin.dart';

class {{feature_name.pascalCase()}}View extends StatefulWidget {
  const {{feature_name.pascalCase()}}View({super.key});

  @override
  State<{{feature_name.pascalCase()}}View> createState() => _{{feature_name.pascalCase()}}ViewState();
}

class _{{feature_name.pascalCase()}}ViewState extends State<{{feature_name.pascalCase()}}View> with {{feature_name.pascalCase()}}Mixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
