import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/model/girl_photo_model.dart';
import 'package:bloc_architecture/repository/i_counter_repository.dart';
import 'package:injectable/injectable.dart';

// @Injectable(as: ICounterRepository, env: [Environment.prod])
// class ProdCounterRepository implements ICounterRepository {
//
//   @override
//   Future getGirlPhotos() async {
//     apiService.get("https://gank.io/api/v2/data/category/Girl/type/Girl/page/1/count/10");
//   }
// }