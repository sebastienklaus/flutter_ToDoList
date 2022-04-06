import 'package:flutter/material.dart';
import 'package:todo_list/screens/all_tasks.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:provider/provider.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static String get route => '/home';

  @override
  Widget build(BuildContext context) {
    int tasksCompleted = context.read<TasksCollection>().totalTasksComplete();
    int total = context.read<TasksCollection>().lengthListTasks();

    var parser = EmojiParser();
    String wave = parser.get('wave').code;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 0, 180, 219),
                        Color.fromARGB(255, 0, 157, 192),
                      ])),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/profile_pic.png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Bienvenue, Sébastien Klaus',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.popAndPushNamed(context, AllTasks.route);
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  image: const DecorationImage(
                      image: AssetImage('assets/images/tasks.png'),
                      fit: BoxFit.cover,
                      isAntiAlias: false),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Ma liste de tâches',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ]),
              ),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                image: const DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('assets/images/check.png'),
                    fit: BoxFit.cover,
                    isAntiAlias: false),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Nombres de tâches complétées',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$tasksCompleted / $total',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                      maxLines: 2,
                    ),
                  ]),
            ),
          ],
        ),
      ),
      bottomSheet: Text(
        '$wave Made by Sébastien Klaus | 2022 $wave',
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [],
      // ),
    );
  }
}
