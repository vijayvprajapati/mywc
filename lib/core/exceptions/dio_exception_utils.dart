// ignore_for_file: avoid_classes_with_only_static_members
//This class contain diff-diff types of error fired by dio while doing api call process

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'app_exception.dart';

class DioExceptionUtil {
  // general methods:------------------------------------------------------------
  static String handleError(DioException error) {
    String errorDescription = 'S.current.unknownError';

    debugPrint(error.toString());
    switch (error.type) {
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          errorDescription =
              'S.current.connectionToServerFailedDueToInternetConnection';
        } else if (error.response!.statusCode == -9) {
          errorDescription = 'S.current.noActiveInternetConnection';
        } else {
          errorDescription =
              'S.current.somethingWentWrongPleaseTryAfterSometime';
        }
        break;

      case DioExceptionType.cancel:
        errorDescription = 'S.current.requestToServerWasCancelled';
        break;
      case DioExceptionType.connectionTimeout:
        throw RequestCanceledException('S.current.connectionTimeoutWithServer');

      case DioExceptionType.receiveTimeout:
        throw ServerSideException(
          ' S.current.requestCantBeHandledForNowPleaseTryAfterSometime',
        );

      case DioExceptionType.badResponse:
        debugPrint("Response:");
        debugPrint(error.toString());
        if (error.response!.statusCode == 12039 ||
            error.response!.statusCode == 12040) {
          throw ConnectionException(
            'S.current.connectionToServerFailedDueToInternetConnection',
          );
        } else if (401 == error.response!.statusCode) {
          //locator.get<AppDB>().logOut();
          //locator<AppRouter>().replaceAll([const LoginRoute()]);
          throw UnauthorisedException('S.current.pleaseLoginAgain');
        } else if (401 < error.response!.statusCode! &&
            error.response!.statusCode! <= 417) {
          throw BadRequestException(
              'S.current.somethingWhenWrongPleaseTryAgain');
        } else if (500 <= error.response!.statusCode! &&
            error.response!.statusCode! <= 505) {
          throw ServerSideException(
            'S.current.requestCantBeHandledForNowPleaseTryAfterSometime',
          );
        } else {
          throw InvalidInputException(
            'S.current.somethingWentWrongPleaseTryAfterSometime',
          );
        }

      case DioExceptionType.sendTimeout:
        throw ServerSideException(
          'S.current.requestCantBeHandledForNowPleaseTryAfterSometime',
        );
      case DioExceptionType.badCertificate:
        throw ServerSideException(
          'S.current.requestCantBeHandledForNowPleaseTryAfterSometime',
        );
      case DioExceptionType.connectionError:
        throw RequestCanceledException('S.current.connectionTimeoutWithServer');
    }

    return errorDescription;
  }
}
