import '../../../../core/helper/extension/context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import '../../../../core/consts/color/app_colors.dart';
import '../mixin/subscriptions_mixin.dart';
import '../view_model/subscriptions_view_model.dart';

class SubscriptionsView extends StatefulWidget {
  const SubscriptionsView({super.key});

  @override
  State<SubscriptionsView> createState() => _SubscriptionsViewState();
}

class _SubscriptionsViewState extends State<SubscriptionsView> with SubscriptionsMixin {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SubscriptionsViewModel>();
    return Stack(
      children: [
        PaywallView(
          onPurchaseStarted: provider.onPurchaseStarted,
          onPurchaseError: provider.onPurchaseError,
          onPurchaseCompleted: provider.onPurchaseCompleted,
          onPurchaseCancelled: provider.onPurchaseCancelled,
          onRestoreCompleted: provider.onRestoreCompleted,
          onRestoreError: provider.onRestoreError,
        ),
        /*
        Positioned(
          top: 20.h + MediaQuery.of(context).viewPadding.top,
          right: 30.w,
          child: GestureDetector(
            onTap: getIt<RouteService>().pop,
            child: Material(
              borderRadius: BorderRadius.circular(18.w),
              elevation: 2,
              child: CircleAvatar(
                radius: 18.w,
                backgroundColor: AppColors.white,
                child: Assets.icons.cross.svg(width: 20.w),
              ),
            ),
          ),
        ),
         */
        if (provider.isLoading == true)
          Positioned.fill(
            child: Container(
              height: context.height,
              width: context.width,
              color: Colors.white.withValues(alpha: 0.5),
              child: const Center(child: CupertinoActivityIndicator(color: AppColors.black, radius: 15)),
            ),
          ),
      ],
    );
  }
}
