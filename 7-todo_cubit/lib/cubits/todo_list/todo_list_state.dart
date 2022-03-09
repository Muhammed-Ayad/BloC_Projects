part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  const TodoListState({
    required this.todos,
  });

  @override
  List<Object> get props => [todos];
  factory TodoListState.initial(){
    return TodoListState(todos: [
      Todo(id:'1',desc: 'clear the room'),
      Todo(id:'2',desc: 'wash the dish'),
      Todo(id:'3',desc: 'Do homework'),
    ]);
  }

  @override
  String toString() => 'TodoListState(todos: $todos)';

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
