import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/core/result.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/model/girl_photo_model.dart';
import 'package:bloc_architecture/repository/i_counter_repository.dart';
import 'package:bloc_architecture/ui/counter/girl_event.dart';
import 'package:injectable/injectable.dart';

@injectable
class GirlBloc extends Bloc<GirlEvent, Result<dynamic>> {
  final String tag = "CounterBloc";

  final ICounterRepository _counterRepository;

  List<GirlPhotoModel> dataList = List();

  GirlBloc(this._counterRepository) : super(Result.loading());

  @override
  Stream<Result<dynamic>> mapEventToState(
    GirlEvent event,
  ) async* {
    if (event is GirlLoadingEvent) {
      // yield Result.loading();
      logger.d(tag, "loading event page= ${event.page}");
      if (event.page == 1) {
        dataList.clear();
      }
      var response = await _counterRepository.getGirlPhotos(event.page, 10);
      var result;
      response.when(loading: () {
        result = Result.loading();
      }, success: (data, total, current) {
        dataList.addAll((data as GirlPhotoListModel).girlPhotoList);
        result = Result.success(dataList, total, current);
      }, failure: (error) {
        result = Result.failure(error);
      });
      yield result;
    }
  }
}
