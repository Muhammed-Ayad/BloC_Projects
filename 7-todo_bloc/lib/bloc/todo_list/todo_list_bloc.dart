import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    on<AddTodoEvent>((event, emit) {
      final newDesc = Todo(desc: event.newDecs);
      final newTodo = [...state.todo, newDesc];
      emit(state.copyWith(todo: newTodo));
    });
    on<EditTodoEvent>((event, emit) {
      final newTodo = state.todo.map((Todo todo) {
        if (event.id == todo.id) {
          return Todo(
            id: event.id,
            desc: event.newDecs,
            completed: todo.completed,
          );
        }
        return todo;
      }).toList();
      emit(state.copyWith(todo: newTodo));
    });
    on<ToggleTodoEvent>((event, emit) {
      final newTodo = state.todo.map((Todo todo) {
        if (event.id == todo.id) {
          return Todo(
            id: event.id,
            desc: todo.desc,
            completed: !todo.completed,
          );
        }
        return todo;
      }).toList();
      emit(state.copyWith(todo: newTodo));
    });

    on<RemoveTodoEvent>((event, emit) {
      final removeTodo =
          state.todo.where((Todo todo) => todo.id != event.todo.id).toList();
      emit(state.copyWith(todo: removeTodo));
    });
  }
}
