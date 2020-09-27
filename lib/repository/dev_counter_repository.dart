import 'package:bloc_architecture/repository/i_counter_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DevCounterRepository implements ICounterRepository {

  @override
  int getIncrement() => 2;
}