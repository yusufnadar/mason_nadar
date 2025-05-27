import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../consts/color/app_colors.dart';

class ToastService {
  static void success(msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColors.black,
      textColor: AppColors.white,
      fontSize: 16,
    );
  }

  static void warning(String? msg) {
    Fluttertoast.showToast(
      msg: msg ?? '',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: AppColors.white,
      fontSize: 16,
    );
  }
}
