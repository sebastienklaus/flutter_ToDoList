import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/screens/all_tasks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/screens/create_task.dart';
import 'package:todo_list/screens/one_task.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TasksCollection(),
    child: MaterialApp(
      initialRoute: '/all_tasks',
      routes: {
        '/all_tasks': (context) => const AllTasks(
              title: 'Todo List',
            ),
        '/one_task': (context) => const OneTask(),
        '/create_task': (context) => const CreateTask(),
      },
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
      home: const AllTasks(
        title: 'Todo List',
      ),
    );
  }
}
