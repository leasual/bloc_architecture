// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_service.dart';
import '../ui/counter/counter_bloc.dart';
import '../repository/dev_counter_repository.dart';
import '../repository/i_counter_repository.dart';
import '../util/logger.dart';
import 'third_party_module.dart';

/// Environment names
const _dev = 'dev';
const _prod = 'prod';
const _test = 'test';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyModule = _$ThirdPartyModule();
  gh.lazySingleton<APIService>(() => thirdPartyModule.apiService);
  gh.factory<ICounterRepository>(() => DevCounterRepository(),
      registerFor: {_dev});
  gh.lazySingleton<Logger>(() => thirdPartyModule.logger);
  gh.factory<String>(() => thirdPartyModule.devBaseUrl,
      instanceName: 'BaseUrl', registerFor: {_dev});
  gh.factory<String>(() => thirdPartyModule.prodBaseURL,
      instanceName: 'BaseUrl', registerFor: {_prod});
  gh.factory<String>(() => thirdPartyModule.testBaseUrl,
      instanceName: 'BaseUrl', registerFor: {_test});
  gh.factory<CounterBloc>(() => CounterBloc(get<ICounterRepository>()));
  gh.lazySingleton<Dio>(
      () => thirdPartyModule.dio(get<String>(instanceName: 'BaseUrl')));

  // Eager singletons must be registered in the right order
  final sharedPreferences = await thirdPartyModule.prefs;
  gh.singleton<SharedPreferences>(sharedPreferences);
  return get;
}

class _$ThirdPartyModule extends ThirdPartyModule {}
