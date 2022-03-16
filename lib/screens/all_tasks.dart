import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/tasks/task_details.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/components/tasks/task_master.dart';
import 'package:todo_list/screens/create_task.dart';

import 'package:todo_list/tools/showSnackBar.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title})
      : super(key: key); //constrcuteur

  final String title;
  static String get route => '/all_tasks';

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  Task? selectedTask;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<TasksCollection>(context, listen: false).getTaskFromAPI();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: ((context, tasksCollection, child) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: [
          PopupMenuButton(
              onSelected: (result) {
                if (result == 1) {
                  tasksCollection.sortByName();
                }
                if (result == 2) {
                  tasksCollection.sortByStatus();
                }
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.sort_by_alpha_outlined,
                            color: Colors.black,
                          ),
                          Text(' Tri par ordre alphabétique'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      // enabled: false,
                      value: 2,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.sort,
                            color: Colors.black,
                          ),
                          Text(' Tri par statut'),
                        ],
                      ),
                    ),
                  ])
        ]),
        body: Column(
          children: <Widget>[
            (selectedTask != null)
                ? TaskDetails(
                    task: selectedTask,
                    //callback of onRemove line 54 (Widget CloseButton) task_details
                    onClose: () {
                      setState(() {
                        selectedTask = null;
                      });
                    },
                    //callback of onRemove line 86 task_details
                    onRemove: () {
                      setState(() {
                        //on appelle la source de données du Consumer (ou Provider plutôt)
                        //ainsi que sa méthode deleteTask()
                        tasksCollection.deleteTask(selectedTask!);
                        //hide taskDetails
                        selectedTask = null;
                        //hide current snackbar
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        //display snackBar of success
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBarMessage()
                                .success('Cette tâche à bien été supprimé'));
                      });
                    })
                : Container(), //container when we have nothing to display !
            Expanded(
              child: TaskMaster(
                  dataTasks: tasksCollection.getAllTAsks(),
                  //on récupère la méthode selectedTask du fichier task_details
                  giveTaskToAllTasks: (Task newval) {
                    setState(() {
                      selectedTask = newval;
                    });
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.pushNamed(context, CreateTask.route);
          },
          tooltip: 'Add a task',
          child: const Icon(Icons.add),
        ),
      );
    }));
  }
}
