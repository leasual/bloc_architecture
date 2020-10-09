import 'package:bloc_architecture/api/api_service.dart';
import 'package:bloc_architecture/util/logger.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ThirdPartyModule {
  // same thing works for instances that's gotten asynchronous.
  // all you need to do is wrap your instance with a future and tell injectable how
  // to initialize it
  @preResolve // if you need to pre resolve the value
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

// Also, make sure you await for your configure function before running the App.

  @lazySingleton
  Logger get logger => Logger();

  // You can register named preemptive types like follows
  @Named("BaseUrl")
  @Injectable(env: [Environment.dev])
  String get devBaseUrl => 'https://gank.io/api/v2/data/category/';

  @Named("BaseUrl")
  @Injectable(env: [Environment.prod])
  String get prodBaseURL => 'https://gank.io/api/v2/data/category/';

  @Named("BaseUrl")
  @Injectable(env: [Environment.test])
  String get testBaseUrl => 'https://gank.io/api/v2/data/category/';

  // url here will be injected
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(
        baseUrl: url,
        connectTimeout: 10000, //10s
        receiveTimeout: 10000, //10s
      ));

  @lazySingleton
  APIService get apiService => APIService();
}
