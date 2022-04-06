import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/screens/all_tasks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/screens/create_task.dart';
import 'package:todo_list/screens/one_task.dart';
import 'package:todo_list/screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var tasksCollection = TasksCollection();
  await tasksCollection.getTasksDatasFromAPI();

  runApp(ChangeNotifierProvider(
    create: (context) => TasksCollection(),
    child: const TodoList(),
  ));
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

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
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      routes: {
        OneTask.route: (context) => const OneTask(),
        AllTasks.route: (context) => const AllTasks(
              title: 'Todo List',
            ),
        CreateTask.route: (context) => const CreateTask(),
        HomePage.route: ((context) => const HomePage())
      },
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      // supportedLocales: const [Locale('en'), Locale('fr')],
    );
  }
}
