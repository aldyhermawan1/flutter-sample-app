import 'dart:io';

import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:sample/core/app/flavor_config.dart';
import 'package:sample/core/base/network/header_interceptor.dart';
import 'package:sample/core/base/preference/secure_preference/secure_preference_manager.dart';
import 'package:sample/core/base/preference/secure_preference/secure_preference_manager_impl.dart';
import 'package:sample/core/base/preference/shared_preference/preference_manager.dart';
import 'package:sample/core/base/preference/shared_preference/preference_manager_impl.dart';
import 'package:sample/features/jokes/di/joke_module.dart';
import 'package:sample/utils/constants/app_constants.dart';
import 'package:sample/utils/security_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future injectModules() async {
  await _injectSharedPreferences();
  _injectSecurePreferences();
  _injectDio();
  _injectAppModule();
}

Future _injectSharedPreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  PreferenceManager manager = PreferenceManagerImplementation(preferences);
  locator.registerLazySingleton(() => manager);
}

_injectSecurePreferences() {
  FlutterSecureStorage flutterSecureStorage =
      SecurityUtils.getSecureStorage(AppConstants.securePreferenceName);
  SecurePreferenceManager manager =
      SecurePreferenceManagerImplementation(flutterSecureStorage);
  locator.registerLazySingleton(() => manager);
}

_injectDio() {
  BaseOptions options = BaseOptions(
    baseUrl: FlavorConfig.baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    followRedirects: false,
  );

  Alice alice = Alice(
    showNotification: (FlavorConfig.isDevelopment() && Platform.isAndroid) ||
        (FlavorConfig.isProduction() && !kReleaseMode && Platform.isAndroid),
    showInspectorOnShake: (FlavorConfig.isDevelopment() && Platform.isIOS) ||
        (FlavorConfig.isProduction() && !kReleaseMode && Platform.isIOS),
  );

  Logger logger = Logger(printer: PrettyPrinter(lineLength: 500));

  Dio dio = Dio(options);
  dio.interceptors.add(HeaderInterceptor(logger));
  dio.interceptors.add(alice.getDioInterceptor());
  locator
    ..registerLazySingleton(() => dio)
    ..registerLazySingleton(() => alice);
}

_injectAppModule() {
  injectJokeModule();
}
