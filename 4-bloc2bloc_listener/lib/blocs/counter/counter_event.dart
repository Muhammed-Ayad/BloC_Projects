part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class ChangeCounterEvent extends CounterEvent {
  final int increment;

  const ChangeCounterEvent({required this.increment});
  @override
  List<Object> get props => [increment];
}
