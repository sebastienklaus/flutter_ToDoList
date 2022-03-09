import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/tasks/task_details.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/components/tasks/task_master.dart';
import 'package:todo_list/components/tasks/task_form.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title, required this.listTasks})
      : super(key: key); //constrcuteur

  final String title;
  final List<Task> listTasks;

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  Task? selectedTask;
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    tasks = widget.listTasks;
  }

  //Show Widget of TaskDetails if it's selected or not
  Widget _showDetailsWhenTaskIsSelected() {
    return (selectedTask != null)
        ? TaskDetails(
            task: selectedTask, onClose: _closeDetails, onRemove: _removeTask)
        : Container(); //container when we have nothing to display !
  }

  //method to close TaskDetails window
  void _closeDetails() {
    setState(() {
      selectedTask = null;
    });
  }

  //method to remove a task
  void _removeTask() {
    final snackBar = SnackBar(
      content: const Text('Êtes-vous sûr de supprimer cette tâche ?'),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'Oui',
        onPressed: () {
          setState(() {
            //remove task from List<Task>
            tasks.removeWhere((item) => item.id == selectedTask!.id);
            //call the method who close the TaskDetails window
            _closeDetails();
            //show the snackBar for suppression confirmation
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Tâche supprimé !'),
            ));
          });
        },
      ),
    );
    // snackBar of question about suppression or not
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //method to add a task
  void _addTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
      // int index = tasks.length + 1;
      // tasks.add(Task(index, faker.lorem.words(3).join(' '), random.boolean(),
      //     faker.date.dateTime(minYear: 2022, maxYear: 2022)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<TasksCollection>(builder: ((context, tasks, child) {
        return Column(
          children: <Widget>[
            _showDetailsWhenTaskIsSelected(), //container when we have nothing to display !
            Expanded(
              child: TaskMaster(
                  dataTasks: tasks.getAllTAsks(),
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
        onPressed: () async {
          Task result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const TaskForm()));
          _addTask(result);
        },
        tooltip: 'Add a task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
