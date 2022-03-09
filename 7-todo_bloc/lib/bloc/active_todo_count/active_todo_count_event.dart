part of 'active_todo_count_bloc.dart';

abstract class ActiveTodoCountEvent extends Equatable {
  const ActiveTodoCountEvent();

  @override
  List<Object> get props => [];
}

class LengthTodoEvent extends ActiveTodoCountEvent {
  final int lengthItem;
  LengthTodoEvent({
    required this.lengthItem,
  });
  @override
  List<Object> get props => [lengthItem];

  @override
  String toString() => 'LengthTodoEvent(lengthItem: $lengthItem)';
}
