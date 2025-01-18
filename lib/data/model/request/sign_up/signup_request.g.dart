// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    SignUpRequestModel(
      firstName: json['firstname'] as String?,
      lastName: json['lastname'] as String?,
      emailId: json['emailId'] as String?,
      mobileNumber: json['mobile_number'] as String?,
    );

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstname', instance.firstName);
  writeNotNull('lastname', instance.lastName);
  writeNotNull('emailId', instance.emailId);
  writeNotNull('mobile_number', instance.mobileNumber);
  return val;
}
