import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:toastification/toastification.dart';
import '../../../../common/provider/user/user_provider.dart';
import '../../../../common/widget/successful_payment_dialog.dart';
import '../../../../core/consts/enum/event_type.dart';
import '../../../../core/services/get_it/get_it_service.dart';
import '../../../../core/services/mix_panel/mix_panel_service.dart';

class SubscriptionsViewModel extends ChangeNotifier {
  bool isLoading = false;

  void changeLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> onPurchaseStarted(Package package) async {
    if (isLoading == true) return;
    changeLoading(true);
    await MixpanelService.track(type: EventType.onPurchaseStarted, args: {'identifier': package.identifier});
  }

  Future<void> onPurchaseCompleted(_, _) async {
    try {
      await MixpanelService.track(type: EventType.onPurchaseCompleted);
      await Future.delayed(const Duration(seconds: 3));
      await getIt<UserProvider>().getUser();
      changeLoading(false);
      SuccessfulPaymentDialog.show();
    } catch (error) {
      await MixpanelService.track(
        type: EventType.onPurchaseCompletedCatchError,
        args: {'error': error.toString() ?? ''},
      );
      toastification.show(
        title: Text(error.toString()),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 5),
      );
      changeLoading(false);
    }
  }

  Future<void> onPurchaseError(PurchasesError error) async {
    changeLoading(false);
    await MixpanelService.track(type: EventType.onPurchaseError, args: {'error': error.message ?? ''});
    toastification.show(
      title: Text(error.message),
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  Future<void> onPurchaseCancelled() async {
    await MixpanelService.track(type: EventType.onPurchaseCancelled);
    changeLoading(false);
  }

  Future<void> onRestoreCompleted(CustomerInfo customer) async {
    try {
      if (customer.entitlements.all['x Subscription']?.isActive == true) {
        await MixpanelService.track(type: EventType.onRestoreCompleted);
        await Future.delayed(const Duration(seconds: 3));
        await getIt<UserProvider>().getUser();
        changeLoading(false);
        SuccessfulPaymentDialog.show();
      }
    } catch (error) {
      await MixpanelService.track(
        type: EventType.onRestoreCompletedCatchError,
        args: {'error': error.toString() ?? ''},
      );
      toastification.show(
        title: Text('Restore Error'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> onRestoreError(PurchasesError error) async {
    await MixpanelService.track(type: EventType.onRestoreError, args: {'error': error.message ?? ''});
  }
}
