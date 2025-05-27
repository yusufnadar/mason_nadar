import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/helper/extension/context.dart';
import '../../../../core/consts/color/app_colors.dart';
import '../../../../core/consts/text_style/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final Function() onTap;
  final String icon;
  final String text;

  const SocialLoginButton({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 56.w),
        width: context.width,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(999)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, width: 24.w),
            SizedBox(width: 16.w),
            Text(text, style: AppStyles.medium(fontSize: 16, color: AppColors.black)),
          ],
        ),
      ),
    );
  }
}
