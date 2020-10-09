import 'package:bloc_architecture/core/base_response.dart';
import 'package:bloc_architecture/core/result.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/model/girl_photo_model.dart';
import 'package:bloc_architecture/repository/i_counter_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ICounterRepository, env: [Environment.dev])
class DevCounterRepository implements ICounterRepository {

  @override
  Future<Result<dynamic>> getGirlPhotos(int page,
      int count) async {
    return apiService.getGirlPhotos(page)
        .map((a) => a.fold((l) {
      return Result.failure(l);
    }, (r) {
      final data = BaseResponse<GirlPhotoListModel>.fromJson(
          r, (j) => GirlPhotoListModel.fromJson(r['data']));
      return Result.success(data.data, data.pageCount, data.currentPage);
    }))
        .run();
  }
}
