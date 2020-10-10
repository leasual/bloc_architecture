import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/core/result.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/model/gank_model.dart';
import 'package:bloc_architecture/repository/i_gank_repository.dart';
import 'package:injectable/injectable.dart';
import 'home_page_event.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, Result<dynamic>> {

  final String tag = "CounterBloc";

  final IGankRepository _gankRepository;

  List<GankModel> dataList = List();


  HomePageBloc(this._gankRepository) : super(Result.loading());

  @override
  Stream< Result<dynamic>> mapEventToState(
    HomePageEvent event,
  ) async* {
    if(event is HomePageLoadingGoodsEvent) {
      logger.d(tag, "loading event page= ${event.page}");
      if (event.page == 1) {
        dataList.clear();
      }
      var response = await _gankRepository.getGoods(event.page, 10);
      var result;
      response.when(loading: () {
        result = Result.loading();
      }, success: (data, total, current) {
        dataList.addAll((data as GankListModel).gankModelList);
        result = Result.success(dataList, total, current);
      }, failure: (error) {
        result = Result.failure(error);
      });
      yield result;
    }
  }
}
