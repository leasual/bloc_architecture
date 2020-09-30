import 'package:bloc_architecture/core/network_exceptions.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/model/girl_photo_model.dart';
import 'package:dartz/dartz.dart';

// 后面可以参考https://github.com/trevorwang/retrofit.dart
// 目前感觉扩展性以及稳定性还有待考究
class APIService {
  //get girl photos
  Task<Either<NetworkExceptions, GirlPhotoListModel>> getGirlPhotos(int page,
      {int count = 10}) {
    return dioHelper.get("Girl/type/Girl/page/$page/count/$count");
  }
}
