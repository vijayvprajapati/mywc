//dio client setup
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mywc/core/api_service/api_client/api_client.dart';
import 'package:mywc/core/api_service/api_end_points.dart';
import 'package:mywc/locator/locator.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptor/internet.dart';

class DioClient {
  FutureOr<void> provide() async {
    final dio = await setupDio();

    //register dio to locator
    locator.registerSingleton(dio);
    //api client
    locator.registerSingleton(ApiClient(dio));
  }

  //function setup dio client
  FutureOr<Dio> setupDio() async {
    final dio = Dio();
    try {
      dio.options = BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),

        responseType: ResponseType.plain,
        //define that api response will be plain text
        headers: {
          'content-type':
              'text/plain', //define that api request will go in plain text
          'contentType': 'text/plain',
          'responseType': 'text/plain',
        },
      );

      //add here other interceptor for logging
      /// Disable logging into production
      if (kDebugMode) {
        dio.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            request: true,
            error: true,
            requestBody: true,
            responseBody: true,
            responseHeader: true,
          ),
        );
      }
      dio.interceptors.add(InternetInterceptors());
    } catch (error) {
      debugPrint('Dio client setup error ${error.toString()}');
    }

    return dio;
  }
}
