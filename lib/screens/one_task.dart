import 'package:flutter/material.dart';
// import 'package:todo_list/components/tasks/task_details.dart';
// import 'package:todo_list/data/tasks.dart' as data;

class OneTask extends StatefulWidget {
  const OneTask({Key? key, required this.title})
      : super(key: key); //constrcuteur

  final String title;

  @override
  _OneTaskState createState() => _OneTaskState();
}

class _OneTaskState extends State<OneTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: TaskDetails(task: data.tasks),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add a task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
