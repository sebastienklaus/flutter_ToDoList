import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/tasks/task_details.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/components/tasks/task_master.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title})
      : super(key: key); //constrcuteur

  final String title;

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  Task? selectedTask;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<TasksCollection>(
          builder: ((context, tasksCollection, child) {
        return Column(
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
                        //display snackBar of success
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                          content: Text('Tâche supprimé !'),
                        ));
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
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add a task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
