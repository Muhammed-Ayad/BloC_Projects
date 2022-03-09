part of 'active_todo_count_bloc.dart';

class ActiveTodoCountState extends Equatable {
  final int lengthTodo;
  const ActiveTodoCountState({required this.lengthTodo});

  @override
  List<Object> get props => [lengthTodo];

  factory ActiveTodoCountState.initial() {
    return ActiveTodoCountState(lengthTodo: 0);
  }

  @override
  String toString() => 'ActiveTodoCountState(lengthTodo: $lengthTodo)';

  ActiveTodoCountState copyWith({
    int? lengthTodo,
  }) {
    return ActiveTodoCountState(
      lengthTodo: lengthTodo ?? this.lengthTodo,
    );
  }
}
