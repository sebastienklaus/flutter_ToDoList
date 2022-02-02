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
  late Task taskDetails;
  bool _display = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _display
          ? TaskDetails(task: taskDetails)
          : TaskMaster(
              dataTasks: data.tasks,
              giveTaskToAllTasks: (Task newval) {
                print("newval = ${newval.content}");
                setState(() {
                  taskDetails = newval;
                  _display = true;
                });
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add a task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
