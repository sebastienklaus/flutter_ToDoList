import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:todo_list/components/tasks/task_details.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/components/tasks/task_master.dart';

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

  void _addTask() {
    setState(() {
      int index = tasks.length + 1;
      tasks.add(Task(index, faker.lorem.words(3).join(' '), random.boolean(),
          faker.date.dateTime(minYear: 2022, maxYear: 2022)));
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
                dataTasks: tasks,
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
          _addTask();
        },
        tooltip: 'Add a task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
