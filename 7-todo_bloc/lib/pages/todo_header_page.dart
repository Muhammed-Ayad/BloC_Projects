import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/bloc/active_todo_count/active_todo_count_bloc.dart';

class TodoHeaderPage extends StatelessWidget {
  const TodoHeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'ToDo',
          style: TextStyle(fontSize: 35),
        ),
        BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
          builder: (context, state) {
            return Text(
              '${state.lengthTodo} items',
              style: TextStyle(fontSize: 25, color: Colors.red),
            );
          },
        ),
      ],
    );
  }
}
