import 'package:dartz/dartz.dart';

import '../../core/base/model/error_model/base_error_model.dart';
import '../../core/consts/end_point/app_end_points.dart';
import '../../core/consts/enum/http_type_enums.dart';
import '../../core/services/network/mapper/api_model_mapper.dart';
import '../../core/services/network/network_service.dart';
import '../model/user/user_model.dart';

class UserDataSource {
  final NetworkService _networkService;

  UserDataSource(this._networkService);

  Future<Either<BaseErrorModel, UserModel>> getUser() async {
    return await _networkService.call(
      AppEndpoints.getUser,
      mapper: (json) {
        return APIModelMapper.jsonToItem(json, UserModel.fromJson);
      },
      httpTypes: HttpTypes.get,
    );
  }
}
