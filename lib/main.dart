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
    child: const TodoList(),
  ));
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      return FutureBuilder(
          future: tasksCollection.getTaskFromAPI(),
          builder: ((context, snapshot) {
            return MaterialApp(
              title: 'Todo List',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: GoogleFonts.robotoTextTheme(
                  Theme.of(context).textTheme,
                ),
              ),
              debugShowCheckedModeBanner: false,
              initialRoute: AllTasks.route,
              routes: {
                OneTask.route: (context) => const OneTask(),
                AllTasks.route: (context) => AllTasks(
                      title: 'Todo List',
                      listTasks: snapshot.data,
                    ),
                CreateTask.route: (context) => const CreateTask(),
              },
            );
          }));
    });
  }
}



// Consumer<TasksCollection>(
//         builder: (context, tasksCollection, child) {
//       var listsTasks = tasksCollection.getTaskFromAPI();
//       return MaterialApp(
//         title: 'Todo List',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           textTheme: GoogleFonts.robotoTextTheme(
//             Theme.of(context).textTheme,
//           ),
//         ),
//         debugShowCheckedModeBanner: false,
//         initialRoute: AllTasks.route,
//         routes: {
//           OneTask.route: (context) => const OneTask(),
//           AllTasks.route: (context) => AllTasks(
//                 title: 'Todo List',
//                 listTasks: listsTasks,
//               ),
//           CreateTask.route: (context) => const CreateTask(),
//         },
//       );
//     });