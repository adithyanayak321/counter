import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterInitialState> {
  CounterBloc() : super(CounterInitialState(counterNumber: 0));

  @override
  Stream<CounterInitialState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementEvent) {
      yield CounterInitialState(counterNumber: state.counterNumber + 1);
    } else if (event is DecrementEvent) {
      yield CounterInitialState(counterNumber: state.counterNumber - 1);
    }
  }
}
