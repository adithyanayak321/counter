part of 'counter_bloc.dart';

class CounterInitialState {
  int counterNumber;
  CounterInitialState({this.counterNumber});
  List<Object> get props => [counterNumber];
}
