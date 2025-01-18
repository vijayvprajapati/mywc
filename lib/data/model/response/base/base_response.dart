//base response class for parsing response from every api call

import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(
    includeIfNull: false, genericArgumentFactories: true, anyMap: true)
class BaseResponse<T> {
  BaseResponse({this.status, this.code, this.message, this.data});

  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'code')
  final int? code;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'data')
  final T? data;

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
