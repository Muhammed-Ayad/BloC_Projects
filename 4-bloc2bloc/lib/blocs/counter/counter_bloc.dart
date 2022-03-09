import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc2bloc/blocs/color/color_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int increment = 1;
  late final StreamSubscription colorSubscription;
  final ColorBloc colorBloc;
  CounterBloc({required this.colorBloc}) : super(CounterState.initial()) {
    colorSubscription = colorBloc.stream.listen((colorState) {
      if (colorState.color == Colors.red) {
        increment = 1;
      } else if (colorState.color == Colors.blue) {
        increment = 10;
      } else if (colorState.color == Colors.green) {
        increment = 100;
      } else if (colorState.color == Colors.black) {
        increment = -100;
        add(ChangeCounterEvent());
      }
    });
    on<ChangeCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + increment));
    });
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
