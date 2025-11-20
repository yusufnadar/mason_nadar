import 'package:purchases_flutter/purchases_flutter.dart';

class AppConstants {
  static const appName = 'appName';
  static const fontFamily = 'fontFamily';
  static List<StoreProduct> subscriptions = <StoreProduct>[];
  static List<StoreProduct> products = <StoreProduct>[];
  static CustomerInfo? customerInfo;
  static Offering? offer;
}

class NotificationConstants{
  static const channelKey = 'channelKey';
  static const channelGroupKey = 'channelGroupKey';
  static const channelName = 'channelName';
  static const channelDescription = 'channelDescription';
}
