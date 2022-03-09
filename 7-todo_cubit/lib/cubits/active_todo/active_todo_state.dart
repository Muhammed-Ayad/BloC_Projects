part of 'active_todo_cubit.dart';

class ActiveTodoState extends Equatable {
  final int activeTodoCount;
  const ActiveTodoState({
    required this.activeTodoCount,
  });

  @override
  List<Object> get props => [activeTodoCount];

  factory ActiveTodoState.initial() {
    return ActiveTodoState(activeTodoCount: 0);
  }

  @override
  String toString() => 'ActiveTodoState(activeTodoCount: $activeTodoCount)';

  ActiveTodoState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
