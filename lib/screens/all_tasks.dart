import 'package:flutter/material.dart';
import 'package:todo_list/components/tasks/task_details.dart';
import 'package:todo_list/data/tasks.dart' as data;
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

  Widget _showDetailsWhenTaskIsSelected() {
    return (selectedTask != null)
        ? TaskDetails(task: selectedTask, onClose: _closeDetails)
        : Container(); //container when we have nothing to display !
  }

  void _closeDetails() {
    setState(() {
      selectedTask = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          _showDetailsWhenTaskIsSelected(), //container when we have nothing to display !
          Expanded(
            child: TaskMaster(
                dataTasks: data.tasks,
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
        onPressed: () {},
        tooltip: 'Add a task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
