import 'package:dartz/dartz.dart';
import '../../../../core/services/network/mapper/api_model_mapper.dart';
import '../../../../core/base/model/error_model/base_error_model.dart';
import '../../../../core/consts/enum/http_type_enums.dart';
import '../../../../core/services/network/network_service.dart';
import '../model/landing_model.dart';

class LandingDataSource {
  final NetworkService _networkService;

  LandingDataSource(this._networkService);

  Future<Either<BaseErrorModel, LandingModel>> sample({required LandingModel landingModel}) async {
    return _networkService.call(
      'sample', //AppEndpoints.sample,
      data: landingModel.toJson(),
      mapper: (json) => APIModelMapper.jsonToItem(json, LandingModel.fromJson),
      httpTypes: HttpTypes.post,
    );
  }
}
