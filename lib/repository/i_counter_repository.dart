
import 'package:bloc_architecture/api/api_service.dart';
import 'package:bloc_architecture/model/girl_photo_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICounterRepository {

  Future<Either<Failure, dynamic>> getGirlPhotos();

}