import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/bloc/filtered_todo/filtered_todo_bloc.dart';
import 'package:todo_cubit/bloc/todo_list/todo_list_bloc.dart';

import '../models/todo_model.dart';

class ShowTodoPage extends StatelessWidget {
  const ShowTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = context.watch<FilteredTodoBloc>().state.todo;
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemCount: todo.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(todo[index].id),
          background: showBackground(),
          secondaryBackground: showBackground(),
          onDismissed: (_) {
            context
                .read<TodoListBloc>()
                .add(RemoveTodoEvent(todo: todo[index]));
          },
          confirmDismiss: (_) {
            return showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Are you sure?'),
                    content: Text('Do you really want to delete?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text('NO'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text('YES'),
                      ),
                    ],
                  );
                });
          },
          child: TodoItem(
            todo: todo[index],
          ),
        );
      },
    );
  }

  Widget showBackground() {
    return Container(
      color: Colors.red,
    );
  }
}

class TodoItem extends StatefulWidget {
  final Todo todo;
  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              bool _error = false;
              textController.text = widget.todo.desc;
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text('Edit Todo'),
                    content: TextField(
                      controller: textController,
                      autofocus: true,
                      decoration: InputDecoration(
                        errorText: _error ? "Value cannot be empty" : null,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _error = textController.text.isEmpty ? true : false;
                            if (!_error) {
                              context.read<TodoListBloc>().add(EditTodoEvent(
                                  id: widget.todo.id,
                                  newDecs: textController.text));
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: Text('EDIT'),
                      )
                    ],
                  );
                },
              );
            });
      },
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: (bool? checked) {
          context.read<TodoListBloc>().add(ToggleTodoEvent(id: widget.todo.id));
        },
      ),
      title: Text(widget.todo.desc),
    );
  }
}
