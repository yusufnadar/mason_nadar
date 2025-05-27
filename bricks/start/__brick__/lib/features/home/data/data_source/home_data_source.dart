import 'package:dartz/dartz.dart';
import '../../../../core/services/network/mapper/api_model_mapper.dart';
import '../../../../core/base/model/error_model/base_error_model.dart';
import '../../../../core/consts/enum/http_type_enums.dart';
import '../../../../core/services/network/network_service.dart';
import '../model/home_model.dart';

class HomeDataSource {
  final NetworkService _networkService;

  HomeDataSource(this._networkService);

  Future<Either<BaseErrorModel, HomeModel>> sample({required HomeModel homeModel}) async {
    return _networkService.call(
      'sample', //AppEndpoints.sample,
      data: homeModel.toJson(),
      mapper: (json) => APIModelMapper.jsonToItem(json, HomeModel.fromJson),
      httpTypes: HttpTypes.post,
    );
  }
}
