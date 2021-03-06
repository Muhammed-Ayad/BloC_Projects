import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_cubit/models/todo_model.dart';

part 'active_todo_state.dart';

class ActiveTodoCubit extends Cubit<ActiveTodoState> {
  late final StreamSubscription todoListSubscription;
  final int initialActiveTodoCount;
  final TodoListCubit todoListCubit;
  ActiveTodoCubit(
      {required this.initialActiveTodoCount, required this.todoListCubit})
      : super(ActiveTodoState(activeTodoCount: initialActiveTodoCount)) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print('todoListState :$todoListState');
      final int currentActiveTodoCount = todoListState.todos
          .where((Todo todo) => !todo.completed)
          .toList()
          .length;

      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
