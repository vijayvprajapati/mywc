//sign up request model for parsing sign api request json body

import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable(includeIfNull: false)
class SignUpRequestModel {
  SignUpRequestModel(
      {this.firstName, this.lastName, this.emailId, this.mobileNumber});

  @JsonKey(name: 'firstname')
  final String? firstName;
  @JsonKey(name: 'lastname')
  final String? lastName;
  @JsonKey(name: 'emailId')
  final String? emailId;
  @JsonKey(name: 'mobile_number')
  final String? mobileNumber;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
