part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String search;
  const TodoSearchState({
    required this.search,
  });

  @override
  List<Object> get props => [search];

  factory TodoSearchState.initial() {
    return TodoSearchState(search: '');
  }

  @override
  String toString() => 'TodoSearchState(search: $search)';

  TodoSearchState copyWith({
    String? search,
  }) {
    return TodoSearchState(
      search: search ?? this.search,
    );
  }
}
