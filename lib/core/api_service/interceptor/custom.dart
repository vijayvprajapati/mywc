//This class used to setup
//how request will go with header and other params,
//what will be return response of api,
//error handling

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../data/db/app_db.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //set headers
    options.headers['contentType'] = 'text/plain';
    options.headers['content-type'] = 'text/plain';
    options.headers['responseType'] = 'text/plain';
    options.responseType = ResponseType.plain;

    //pass api key if any
    options.headers.putIfAbsent("api-key", () => appDB.authorizationKey);
    //set authorization token

    // if (appDB.token.isNotEmpty) {
    //   options.headers['token'] = appDB.token;
    // }

    debugPrint("Final Header: ${jsonEncode(options.headers)}");
    debugPrint("Final Request: ${options.data}");

    //do encryption if it is in you api request structure
    if (options.data != null) {
      //options.data = locator<EncService>().encrypt(jsonEncode(options.data));
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'Encrypted Response[${response.statusCode}] => BODY: ${response.data}');

    //do decryption if it is in you api response structure

    //final enc = locator.get<EncService>();
    //response.data = jsonDecode(enc.decrypt(response.data.toString()));

    debugPrint(
        'Decrypted Response[${response.statusCode}] => BODY: ${response.data}');

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
