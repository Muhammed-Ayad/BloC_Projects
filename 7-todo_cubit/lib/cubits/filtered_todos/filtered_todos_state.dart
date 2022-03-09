part of 'filtered_todos_cubit.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;
  const FilteredTodosState({required this.filteredTodos});

  @override
  List<Object> get props => [filteredTodos];

  factory FilteredTodosState.initial(){
    return FilteredTodosState(filteredTodos: []);
  }

  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredTodos)';

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
