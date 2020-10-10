import 'package:bloc_architecture/core/result.dart';

abstract class IGankRepository {
  Future<Result<dynamic>> getGirlPhotos(int page, int count);
  Future<Result<dynamic>> getGoods(int page, int count);
}
