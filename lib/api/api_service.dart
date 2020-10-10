import 'package:bloc_architecture/core/dio_extension.dart';
import 'package:bloc_architecture/core/network_exceptions.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:dartz/dartz.dart';

// 后面可以参考https://github.com/trevorwang/retrofit.dart
// 目前感觉扩展性以及稳定性还有待考究
class APIService {
  //get girl photos
  Task<Either<NetworkExceptions, dynamic>> getGirlPhotos(int page, int count) {
    return dio.getX("Girl/type/Girl/page/$page/count/$count");
  }

  Task<Either<NetworkExceptions, dynamic>> getGoods(int page, int count) {
    return dio.getX("GanHuo/type/All/page/$page/count/$count");
  }
}
