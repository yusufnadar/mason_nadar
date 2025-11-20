import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/consts/color/app_colors.dart';
import '../../core/consts/route/app_routes.dart';
import '../../core/consts/text_style/app_text_styles.dart';
import '../../core/services/get_it/get_it_service.dart';
import '../../core/services/route/route_service.dart';
import 'custom_button.dart';

class SuccessfulPaymentDialog {
  static void show() {
    showCupertinoDialog(
      barrierDismissible: false,
      context: getIt<RouteService>().navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.primary,
          title: Column(
            children: [
              SizedBox(height: 20.h),
              //Assets.images.check.image(width: 60.w),
              SizedBox(height: 40.h),
              Text('Successful Subscription', style: AppStyles.semiBold(fontSize: 20)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  'Your payment has been received successfully. You can start using the app.',
                  style: AppStyles.regular(fontSize: 14, color: AppColors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 8.h),
              CustomButton(
                title: 'Thanks',
                onTap: () => getIt<RouteService>().popUntil(path: AppRoutes.home),
                backgroundColor: AppColors.red,
                textColor: AppColors.white,
              ),
              SizedBox(height: 8.h),
            ],
          ),
        );
      },
    );
  }
}
