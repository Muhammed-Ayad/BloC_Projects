import 'package:flutter/material.dart';
import 'package:todo_cubit/pages/create_todo_page.dart';
import 'package:todo_cubit/pages/search_todo_page.dart';
import 'package:todo_cubit/pages/show_todo_page.dart';
import 'package:todo_cubit/pages/todo_header_page.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  TodoHeaderPage(),
                  CreateTodoPage(),
                  SizedBox(height: 10),
                  SearchTodoPage(),
                  ShowTodoPage(),
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
