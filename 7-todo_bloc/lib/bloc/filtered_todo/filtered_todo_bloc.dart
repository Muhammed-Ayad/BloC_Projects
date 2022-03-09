import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_cubit/bloc/todo_filter/todo_filter_bloc.dart';
import 'package:todo_cubit/bloc/todo_list/todo_list_bloc.dart';
import 'package:todo_cubit/bloc/todo_search/todo_search_bloc.dart';
import 'package:todo_cubit/models/todo_model.dart';

part 'filtered_todo_event.dart';
part 'filtered_todo_state.dart';

class FilteredTodoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoSearchSubscription;
  late final StreamSubscription todoListSubscription;

  final TodoFilterBloc todoFilterBloc;
  final TodoSearchBloc todoSearchBloc;
  final TodoListBloc todoListBloc;
  List<Todo> filteredTodo;
  FilteredTodoBloc({
    required this.todoFilterBloc,
    required this.todoSearchBloc,
    required this.todoListBloc,
    required this.filteredTodo,
  }) : super(FilteredTodoState(todo: filteredTodo)) {
    todoFilterSubscription =
        todoFilterBloc.stream.listen((TodoFilterState todoFilterState) {
      setFilteredTodos();
    });

    todoSearchSubscription =
        todoSearchBloc.stream.listen((TodoSearchState todoSearchState) {
      setFilteredTodos();
    });

    todoListSubscription =
        todoListBloc.stream.listen((TodoListState todoListState) {
      setFilteredTodos();
    });

    on<GetFilteredTodoEvent>((event, emit) {
      emit(state.copyWith(todo: event.filterTodo));
    });
  }
  void setFilteredTodos() {
    List<Todo> _filteredTodo;
    switch (todoFilterBloc.state.filter) {
      case Filter.all:
        _filteredTodo = todoListBloc.state.todo;
       
        break;
      case Filter.active:
        _filteredTodo = todoListBloc.state.todo
            .where((Todo todo) => !todo.completed)
            .toList();
        
        break;
      case Filter.completed:
      default:
        _filteredTodo = todoListBloc.state.todo
            .where((Todo todo) => todo.completed)
            .toList();
     
        break;
    }
    if (todoSearchBloc.state.search.isNotEmpty) {
      _filteredTodo = _filteredTodo
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(todoSearchBloc.state.search))
          .toList();
    }
      add(GetFilteredTodoEvent(filterTodo: _filteredTodo));
  }
    @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
