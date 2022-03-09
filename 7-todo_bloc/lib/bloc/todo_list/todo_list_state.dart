part of 'todo_list_bloc.dart';

class TodoListState extends Equatable {
  final List<Todo> todo;
  const TodoListState({required this.todo});

  @override
  List<Object> get props => [todo];
  factory TodoListState.initial() {
    return TodoListState(todo: [
      Todo(id: '1', desc: 'hello World'),
      Todo(id: '2', desc: 'hello Flutter'),
      Todo(id: '3', desc: 'hello Dart'),
    ]);
  }

  @override
  String toString() => 'TodoListState(todo: $todo)';

  TodoListState copyWith({
    List<Todo>? todo,
  }) {
    return TodoListState(
      todo: todo ?? this.todo,
    );
  }
}
