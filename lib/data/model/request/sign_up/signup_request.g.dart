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

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) =>
    <String, dynamic>{
      if (instance.firstName case final value?) 'firstname': value,
      if (instance.lastName case final value?) 'lastname': value,
      if (instance.emailId case final value?) 'emailId': value,
      if (instance.mobileNumber case final value?) 'mobile_number': value,
    };
