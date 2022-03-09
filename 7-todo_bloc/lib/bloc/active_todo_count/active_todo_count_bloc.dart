import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_cubit/bloc/todo_list/todo_list_bloc.dart';
import 'package:todo_cubit/models/todo_model.dart';

part 'active_todo_count_event.dart';
part 'active_todo_count_state.dart';

class ActiveTodoCountBloc
    extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  late final StreamSubscription todoListSubscription;
  final int initialLengthTodo;
  final TodoListBloc todoListBloc;

  ActiveTodoCountBloc({
    required this.initialLengthTodo,
    required this.todoListBloc,
  }) : super(ActiveTodoCountState(lengthTodo: initialLengthTodo)) {
    todoListSubscription =
        todoListBloc.stream.listen((TodoListState todoListState) {
      final length = todoListState.todo
          .where((Todo todo) => !todo.completed)
          .toList()
          .length;

      add(LengthTodoEvent(lengthItem: length));
    });
    on<LengthTodoEvent>((event, emit) {
      emit(state.copyWith(lengthTodo: event.lengthItem));
    });
  }
  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
