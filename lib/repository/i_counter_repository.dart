import 'package:bloc_architecture/core/network_exceptions.dart';
import 'package:bloc_architecture/model/girl_photo_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICounterRepository {
  Future<Either<NetworkExceptions, GirlPhotoListModel>> getGirlPhotos(int page,
      {int count = 10});
}
