import 'package:bloc_architecture/core/result.dart';

abstract class ICounterRepository {
  Future<Result<dynamic>> getGirlPhotos(int page, int count);
}
