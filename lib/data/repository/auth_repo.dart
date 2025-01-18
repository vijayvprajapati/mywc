//This is repository which contain methods defination with return type,name and argument
//you can also define other repo same like this as per your need

import 'package:mywc/data/model/request/login/login_request.dart';

import '../model/request/sign_up/signup_request.dart';
import '../model/response/base/base_response.dart';

abstract class AuthRepository {
  Future<BaseResponse<dynamic>> signIn(LoginRequest request);

  Future<BaseResponse<dynamic>> signUp(SignUpRequestModel request);

  Future<BaseResponse> signOut();
}
