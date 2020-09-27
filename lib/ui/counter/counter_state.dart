part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterIncrementState extends CounterState {
  int counter;

  CounterIncrementState(this.counter);

  void increment() => counter++;
}
