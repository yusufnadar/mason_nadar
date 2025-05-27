import 'package:dio/dio.dart';

import '../../../../common/model/token/token_model.dart';
import '../../../../common/provider/user/user_provider.dart';
import '../../../consts/end_point/app_end_points.dart';
import '../../../consts/enum/http_type_enums.dart';
import '../../../consts/local/app_locals.dart';
import '../../get_it/get_it_service.dart';
import '../../local/local_service.dart';
import '../mapper/api_model_mapper.dart';
import '../network_service.dart';

class NetworkHelper {
  final Dio dio;

  NetworkHelper(this.dio);

  final _networkService = getIt<NetworkService>();
  final _localService = getIt<LocalService>();

  Future<void> onError(DioException exception, ErrorInterceptorHandler handler) async {
    if (exception.response?.statusCode == 401) {
      await refreshToken(exception, handler);
      return;
    }
    handler.next(exception);
  }

  Future<void> refreshToken(DioException exception, ErrorInterceptorHandler handler) async {
    try {
      await _networkService.call(
        AppEndpoints.refreshToken,
        httpTypes: HttpTypes.post,
        data: {'refresh_token': getIt<LocalService>().read(AppLocals.refreshToken)},
        mapper: (json) async {
          final response = APIModelMapper.jsonToItem(json, TokenModel.fromJson);
          await Future.wait([
            _localService.write(AppLocals.accessToken, response.accessToken),
            _localService.write(AppLocals.refreshToken, response.refreshToken),
          ]);
          exception.requestOptions.headers['Authorization'] = 'Bearer ${response.accessToken}';
          return handler.resolve(await dio.fetch(exception.requestOptions));
        },
      );
    } catch (_) {
      await getIt<UserProvider>().logout();
    }
  }
}
