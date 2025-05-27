import 'package:firebase_analytics/firebase_analytics.dart';

import '../../consts/enum/event_type.dart';

class FirebaseAnalyticsService {
  FirebaseAnalyticsService(this.analytics);

  final FirebaseAnalytics analytics;

  Future<void> setUserId({required String? id}) async {
    await analytics.setUserId(id: id);
  }

  Future<void> logEvent({required EventType event, Map<String, Object>? parameters}) async {
    await analytics.logEvent(
      name: event.name,
      parameters: parameters,
    );
  }

  Future<void> logScreenView({required String screenName, Map<String, Object>? parameters}) async {
    await analytics.logScreenView(screenName: screenName, parameters: parameters);
  }
}
