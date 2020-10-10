import 'package:bloc_architecture/core/base_response.dart';
import 'package:bloc_architecture/core/result.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/model/gank_model.dart';
import 'package:bloc_architecture/repository/i_gank_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IGankRepository, env: [Environment.dev])
class DevGankRepository implements IGankRepository {
  @override
  Future<Result<dynamic>> getGirlPhotos(int page, int count) async {
    return apiService
        .getGirlPhotos(page, count)
        .map((a) => a.fold((l) {
      return Result.failure(l);
    }, (r) {
      final data = BaseResponse<GankListModel>.fromJson(
          r, (j) => GankListModel.fromJson(r['data']));
      return Result.success(
          data.data, data.pageCount, data.currentPage);
    }))
        .run();
  }

  @override
  Future<Result> getGoods(int page, int count) {
    return apiService
        .getGoods(page, count)
        .map((a) => a.fold((l) {
      return Result.failure(l);
    }, (r) {
      final data = BaseResponse<GankListModel>.fromJson(
          r, (j) => GankListModel.fromJson(r['data']));
      return Result.success(
          data.data, data.pageCount, data.currentPage);
    }))
        .run();
  }
}
