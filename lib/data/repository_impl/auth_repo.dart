//This class implemented auth repository for using its defined method here inside for further api process from bloc class
//you can define method in auth repo and used it here

import 'package:dio/dio.dart';
import 'package:mywc/core/api_service/api_client/api_client.dart';
import 'package:mywc/core/exceptions/dio_exception_utils.dart';
import 'package:mywc/data/model/request/login/login_request.dart';

import '../../core/exceptions/app_exception.dart';
import '../model/request/sign_up/signup_request.dart';
import '../model/response/base/base_response.dart';
import '../repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepository {
  ApiClient apiClient;

  AuthRepoImpl({required this.apiClient});

  @override
  Future<BaseResponse<dynamic>> signIn(LoginRequest request) async {
    late BaseResponse response;
    try {
      response = await apiClient.signIn(request);

      if (response.code == 400) {
        throw BadRequestException(response.message);
      }
    } on DioException catch (e) {
      DioExceptionUtil.handleError(e);
    }

    return response;
  }

  @override
  Future<BaseResponse> signUp(SignUpRequestModel request) async {
    late BaseResponse response;
    try {
      response = await apiClient.signUp(request);

      if (response.code == 400) {
        throw BadRequestException(response.message);
      }
    } on DioException catch (e) {
      DioExceptionUtil.handleError(e);
    }

    return response;
  }

  @override
  Future<BaseResponse> signOut() async {
    late BaseResponse response;
    try {
      response = await apiClient.signOut();

      if (response.code == 400) {
        throw BadRequestException(response.message);
      }
    } on DioException catch (e) {
      DioExceptionUtil.handleError(e);
    }

    return response;
  }
}
