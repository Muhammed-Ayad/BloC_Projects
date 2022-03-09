part of 'filtered_todo_bloc.dart';

abstract class FilteredTodoEvent extends Equatable {
  const FilteredTodoEvent();

  @override
  List<Object> get props => [];
}

class GetFilteredTodoEvent extends FilteredTodoEvent {
  final List<Todo> filterTodo;
  GetFilteredTodoEvent({
    required this.filterTodo,
  });
  @override
  List<Object> get props => [filterTodo];

  @override
  String toString() => 'GetFilteredTodoEvent(filterTodo: $filterTodo)';
}
