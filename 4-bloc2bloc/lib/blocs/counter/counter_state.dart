part of 'counter_bloc.dart';
 class CounterState extends Equatable {
   final int counter;
  const CounterState({required this.counter});
  
  @override
  List<Object> get props => [counter];
  factory CounterState.initial(){
    return const CounterState(counter: 0);
  }
  
  @override
  String toString() => 'ColorState(color: $counter)';

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}


