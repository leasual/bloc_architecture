import 'package:bloc_architecture/core/result.dart';
import 'package:bloc_architecture/model/girl_photo_model.dart';

abstract class ICounterRepository {
  Future<Result<dynamic>> getGirlPhotos(int page,
      int count);
}
