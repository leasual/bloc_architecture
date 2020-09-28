import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/repository/i_counter_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {

  final ICounterRepository _counterRepository;

  CounterBloc(this._counterRepository) : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if(event is CounterIncrementEvent) {

      yield CounterIncrementState(_counterRepository.getIncrement());
    }
  }
}
