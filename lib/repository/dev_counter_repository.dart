import 'package:bloc_architecture/api/api_service.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/repository/i_counter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ICounterRepository, env: [Environment.dev])
class DevCounterRepository implements ICounterRepository {

  @override
  Future<Either<Failure, dynamic>> getGirlPhotos() async {
    return apiService.get("Girl/type/Girl/page/1/count/10");
  }
}