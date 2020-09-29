import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/core/base_response.dart';
import 'package:bloc_architecture/core/result.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/model/girl_photo_model.dart';
import 'package:bloc_architecture/repository/i_counter_repository.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final String tag = "CounterBloc";

  final ICounterRepository _counterRepository;

  CounterBloc(this._counterRepository) : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is CounterIncrementEvent) {
      String jsonString = await rootBundle.loadString("assets/json/girls.json");
      final jsonResult = json.decode(jsonString);

      final data = BaseResponse<GirlPhotoListModel>.fromJson(
          jsonResult, GirlPhotoListModel.fromJson(jsonResult['data']));
      logger.d(tag, "data= $data");
      // var result = await _counterRepository.getGirlPhotos();
      // result.fold(
      //     (l) => logger.d(tag, "$l"), (r) => logger.d(tag, "message= $r"));
      // logger.d(tag, "bloc get data");
      // yield CounterIncrementState(1);
    }
  }
}
