import 'package:injectable/injectable.dart';

@dev
@prod
@test
@injectable
abstract class ICounterRepository {
  int getIncrement();
}