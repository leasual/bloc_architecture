import 'package:bloc_architecture/api/api_service.dart';
import 'package:bloc_architecture/util/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.config.dart';

//Use the [watch] flag to watch the files' system for edits and rebuild as necessary.
//
// flutter packages pub run build_runner watch
// if you want the generator to run one time and exits use
//
// flutter packages pub run build_runner build

final getIt = GetIt.instance;

final sharePreferences = getIt<SharedPreferences>();

final logger = getIt<Logger>();

final dio = getIt<Dio>();

final apiService = getIt<APIService>();


@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<GetIt> _configureDependencies(String environment) =>
    $initGetIt(getIt, environment: environment);

Future<void> initApp(String environment) async {
  //init dependence
  await _configureDependencies(environment);

  //init router

  // init network request debug
  if(Environment.dev == environment) {
    // Stetho.initialize();
    // enable log output to console
    logger.isDebug = true;
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}