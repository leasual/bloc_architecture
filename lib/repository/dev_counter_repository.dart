import 'package:bloc_architecture/core/base_response.dart';
import 'package:bloc_architecture/core/network_exceptions.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/model/girl_photo_model.dart';
import 'package:bloc_architecture/repository/i_counter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ICounterRepository, env: [Environment.dev])
class DevCounterRepository implements ICounterRepository {

  @override
  Future<Either<NetworkExceptions, GirlPhotoListModel>> getGirlPhotos(int page,
      int count) async {
    return apiService.getGirlPhotos(page)
        .map((a) => a.fold((l) {
              return left<NetworkExceptions, GirlPhotoListModel>(l);
            }, (r) {
              final data = BaseResponse<GirlPhotoListModel>.fromJson(
                  r, (j) => GirlPhotoListModel.fromJson(r));
              return right<NetworkExceptions, GirlPhotoListModel>(data.data);
            }))
        .run();
  }
}
