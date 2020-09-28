import 'package:bloc_architecture/repository/i_counter_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ICounterRepository, env: [Environment.prod])
class ProdCounterRepository implements ICounterRepository {

  @override
  int getIncrement() => 1;
}