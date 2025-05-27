import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/base/model/error_model/base_error_model.dart';
import '../../../../core/consts/end_point/app_end_points.dart';
import '../../../../core/consts/enum/http_type_enums.dart';
import '../../../../core/helper/init/env.dart';
import '../../../../core/services/network/mapper/api_model_mapper.dart';
import '../../../../core/services/network/network_service.dart';
import '../model/login_model.dart';

class LoginDataSource {
  final NetworkService _networkService;

  LoginDataSource(this._networkService);

  Future<Either<BaseErrorModel, LoginModel>?> loginWithGoogle() async {
    try {
      final user = await GoogleSignIn(
        clientId: Platform.isIOS == true ? Env.iosClientId : null,
        serverClientId: Env.webClientId,
      ).signIn();
      final googleAuth = await user?.authentication;
      final String? idToken = googleAuth?.idToken;
      if (idToken != null) {
        return await _networkService.call(
          AppEndpoints.loginWithGoogle,
          data: {'id_token': idToken},
          mapper: (json) => APIModelMapper.jsonToItem(json, LoginModel.fromJson),
          httpTypes: HttpTypes.post,
        );
      } else {
        return null;
      }
    } catch (error) {
      return Left(BaseErrorModel(message: error.toString()));
    }
  }

  Future<Either<BaseErrorModel, LoginModel>?> loginWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final identityToken = credential.identityToken;
      log(identityToken.toString());
      return await _networkService(
        AppEndpoints.loginWithApple,
        data: {'id_token': identityToken},
        mapper: (json) => APIModelMapper.jsonToItem(json, LoginModel.fromJson),
        httpTypes: HttpTypes.post,
      );
    } catch (error) {
      return Left(BaseErrorModel(message: error.toString()));
    }
  }
}
