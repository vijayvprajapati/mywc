import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';
//login api request model for parsing json

@JsonSerializable(
  includeIfNull: false,
)
class LoginRequest {
  LoginRequest({this.email, this.password});

  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'password')
  final String? password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
