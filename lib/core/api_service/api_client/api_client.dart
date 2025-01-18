//api client which contain rest api endpoint call

import 'package:dio/dio.dart';
import 'package:mywc/core/api_service/api_end_points.dart';
import 'package:mywc/data/model/request/login/login_request.dart';
import 'package:mywc/data/model/request/sign_up/signup_request.dart';
import 'package:mywc/data/model/response/base/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  //login api call method
  @POST(ApiEndPoints.signIn)
  Future<BaseResponse> signIn(@Body() LoginRequest request);

  @POST(ApiEndPoints.signUp)
  Future<BaseResponse> signUp(@Body() SignUpRequestModel request);

  @POST(ApiEndPoints.signOut)
  Future<BaseResponse> signOut();
}
