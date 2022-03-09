part of 'filtered_todo_bloc.dart';


class FilteredTodoState extends Equatable {
  final List<Todo> todo;
  const FilteredTodoState({required this.todo});

  @override
  List<Object> get props => [todo];
  factory FilteredTodoState.initial(){
    return FilteredTodoState(todo: []);
  }

  @override
  String toString() => 'FilteredTodosState(todo: $todo)';

  FilteredTodoState copyWith({
    List<Todo>? todo,
  }) {
    return FilteredTodoState(
      todo: todo ?? this.todo,
    );
  }
}
