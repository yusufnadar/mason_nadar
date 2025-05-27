import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class CustomUpgradeAlert extends StatelessWidget {
  final Widget child;

  const CustomUpgradeAlert({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) {
      return UpgradeAlert(
        showLater: false,
        dialogStyle: Platform.isIOS == true ? UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material,
        showIgnore: false,
        upgrader: Upgrader(durationUntilAlertAgain: Duration.zero),
        child: child,
      );
    } else {
      return child;
    }
  }
}
