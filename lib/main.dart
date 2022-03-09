import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/screens/all_tasks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/data/tasks.dart' as data;
import 'package:todo_list/data/tasks_collection.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TasksCollection(),
    child: const MaterialApp(
      home: TodoList(),
    ),
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
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: AllTasks(title: 'Todo List', listTasks: data.tasks),
    );
  }
}
