import 'package:dio/dio.dart';
import '../../../../common/provider/user/user_provider.dart';
import '../../../../common/model/token/token_model.dart';
import '../../../consts/end_point/app_end_points.dart';
import '../../../consts/enum/http_type_enums.dart';
import '../../mix_panel/mix_panel_service.dart';
import '../../../consts/local/app_locals.dart';
import '../../../consts/enum/event_type.dart';
import '../../get_it/get_it_service.dart';
import '../mapper/api_model_mapper.dart';
import '../network_service.dart';

class NetworkHelper {
  Future<void> onError(DioException exception, ErrorInterceptorHandler handler) async {
    MixpanelService.track(
      type: EventType.httpError,
      args: {'endpoint': exception.requestOptions.path, 'error': exception.response?.data ?? ''},
    );
    handler.next(exception);
  }
}
