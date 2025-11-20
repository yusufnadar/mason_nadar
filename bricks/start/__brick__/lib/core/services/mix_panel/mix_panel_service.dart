import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import '../../../common/provider/user/user_provider.dart';
import '../../consts/enum/event_type.dart';
import '../get_it/get_it_service.dart';
import '../../helper/init/env.dart';

class MixpanelService {
  static late Mixpanel _mixpanel;

  static Future<void> init() async {
    _mixpanel = await Mixpanel.init(Env.mixpanelToken, trackAutomaticEvents: true);
    _mixpanel.setLoggingEnabled(true);
  }

  static track({required EventType type, Map<String, dynamic>? args}) {
    final properties = args != null
        ? {...args, 'userId': getIt<UserProvider>().user?.id ?? '0'}
        : {'userId': getIt<UserProvider>().user?.id ?? '0'};

    _mixpanel.track(type.name, properties: properties);
  }
}
