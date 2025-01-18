//central dependency injection of call classes

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mywc/core/api_service/api_client/api_client.dart';
import 'package:mywc/core/api_service/dio_client_setup.dart';
import 'package:mywc/data/db/app_db.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../bloc/login/login_bloc.dart';
import '../data/repository_impl/auth_repo.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  /// setup hive
  if (kIsWeb) {
  } else {
    final appDocumentDir = Platform.isAndroid
        ? await getApplicationDocumentsDirectory()
        : await getLibraryDirectory();

    Hive.init(appDocumentDir.path);
  }

  try {
    //register local db
    locator.registerSingletonAsync<LocalDB>(() => LocalDB.getInstance());

    // setup navigator instance
    //locator.registerLazySingleton(() => AppRouter());

    /// setup API modules with repos which requires [Dio] instance
    await DioClient().provide();

    /// setup encryption service
    // locator.registerLazySingleton(
    //       () => EncService(aesKey: "CGRNjSwcGqCzAR65sgyXVT7jRrjiKl77"),
    // );

    //register api client

    // register repositories implementation
    locator.registerLazySingleton<AuthRepoImpl>(
      () => AuthRepoImpl(apiClient: locator<ApiClient>()),
    );

    //register payment methods
    // locator.registerLazySingleton(() => StripePayment());

    /// register blocs

    locator.registerLazySingleton(() => LoginBloc(authRepoImpl: locator()));
  } catch (e, st) {
    debugPrintStack(stackTrace: st);
  }
}
