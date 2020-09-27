import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

//Use the [watch] flag to watch the files' system for edits and rebuild as necessary.
//
// flutter packages pub run build_runner watch
// if you want the generator to run one time and exits use
//
// flutter packages pub run build_runner build

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies(String environment) =>
    $initGetIt(getIt, environment: environment);
