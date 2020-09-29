import 'package:bloc_architecture/core/network_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class ICounterRepository {

  Future<Either<NetworkExceptions, dynamic>> getGirlPhotos();

}