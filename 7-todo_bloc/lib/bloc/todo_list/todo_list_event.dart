part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String newDecs;
  AddTodoEvent({
    required this.newDecs,
  });
  @override
  List<Object> get props => [newDecs];

  @override
  String toString() => 'AddTodoEvent(newDecs: $newDecs)';
}

class EditTodoEvent extends TodoListEvent {
  final String id;
  final String newDecs;
  EditTodoEvent({
    required this.id,
    required this.newDecs,
  });
  @override
  List<Object> get props => [id, newDecs];

  @override
  String toString() => 'EditTodoEvent(id: $id, newDecs: $newDecs)';
}

class ToggleTodoEvent extends TodoListEvent {
  final String id;
  ToggleTodoEvent({
    required this.id,
  });
  @override
  List<Object> get props => [id];

  @override
  String toString() => 'ToggleTodoEvent(id: $id)';
}

class RemoveTodoEvent extends TodoListEvent {
  final Todo todo;
  RemoveTodoEvent({
    required this.todo,
  });
  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'ToggleTodoEvent(todo: $todo)';
}
