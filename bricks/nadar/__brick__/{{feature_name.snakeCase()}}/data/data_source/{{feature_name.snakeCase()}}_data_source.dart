import 'package:dartz/dartz.dart';
import '../../../../core/services/network/mapper/api_model_mapper.dart';
import '../../../../core/base/model/error_model/base_error_model.dart';
import '../../../../core/consts/enum/http_type_enums.dart';
import '../../../../core/services/network/network_service.dart';
import '../model/{{feature_name.snakeCase()}}_model.dart';

class {{feature_name.pascalCase()}}DataSource {
  final NetworkService _networkService;

  {{feature_name.pascalCase()}}DataSource(this._networkService);

  Future<Either<BaseErrorModel, {{feature_name.pascalCase()}}Model>> sample({required {{feature_name.pascalCase()}}Model {{feature_name.camelCase()}}Model}) async {
    return _networkService.call(
      'sample', //AppEndpoints.sample,
      data: {{feature_name.camelCase()}}Model.toJson(),
      mapper: (json) => APIModelMapper.jsonToItem(json, {{feature_name.pascalCase()}}Model.fromJson),
      httpTypes: HttpTypes.post,
    );
  }
}
