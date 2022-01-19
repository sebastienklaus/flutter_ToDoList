import 'package:flutter/material.dart';
import 'package:todo_list/screens/all_tasks.dart';

void main() {
  runApp(const MaterialApp(
    home: TodoList(),
  ));
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ShadowsIntoLight',
      ),
      home: const AllTasks(title: 'ToDo List'),
    );
  }
}