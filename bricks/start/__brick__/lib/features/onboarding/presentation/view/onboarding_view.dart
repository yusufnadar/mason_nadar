import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../common/widget/custom_button.dart';
import '../../../../core/consts/color/app_colors.dart';
import '../../../../core/consts/text_style/app_text_styles.dart';
import '../mixin/onboarding_mixin.dart';
import '../view_model/onboarding_view_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> with OnboardingMixin {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingViewModel>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 30.w),
        child: Column(
          children: [
            buildImage(provider),
            buildTitle(provider),
            buildSubTitle(provider),
            Spacer(flex: 3),
            buildAnimatedDivider(provider),
            SizedBox(height: 30.h),
            CustomButton(title: 'Continue', onTap: provider.changeCurrentIndex),
            Spacer(),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedDivider(OnboardingViewModel provider) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return Container(
            margin: EdgeInsets.only(right: 12.w),
            width: index == provider.currentIndex ? 20.w : 10.w,
            height: 10.h,
            decoration: BoxDecoration(
              color: index == provider.currentIndex ? AppColors.primary : Colors.grey,
              borderRadius: BorderRadius.circular(16.r),
            ),
          );
        }),
      ),
    );
  }

  Text buildSubTitle(OnboardingViewModel provider) {
    return Text(
      onboardings[provider.currentIndex].subtitle,
      style: AppStyles.regular(fontSize: 16, color: Colors.grey),
      textAlign: TextAlign.center,
    );
  }

  Padding buildTitle(OnboardingViewModel provider) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, bottom: 16.h),
      child: Text(
        onboardings[provider.currentIndex].title,
        style: AppStyles.medium(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }

  Image buildImage(OnboardingViewModel provider) =>
      Image.asset(onboardings[provider.currentIndex].image, height: 400.h, fit: BoxFit.cover);
}
/*
Stack(
          children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(),//Image.asset('',height: 500.h,fit: BoxFit.cover,),
              ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(offset: Offset(0, 9), color: AppColors.white, spreadRadius: 60, blurRadius: 40),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Text(onboardings[provider.currentIndex].title, style: AppStyles.semiBold(fontSize: 28)),
                    ),
                    Text(
                      onboardings[provider.currentIndex].subtitle,
                      style: AppStyles.regular(fontSize: 15, color: AppColors.grey),
                    ),
                    buildAnimatedDivider(provider),
                    CustomButton(title: 'Continue', onTap: provider.changeCurrentIndex),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        )
 */