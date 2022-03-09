import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class OneTask extends StatelessWidget {
  const OneTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Task? task = ModalRoute.of(context)!.settings.arguments as Task?;

    return Scaffold(
      appBar: AppBar(
        title: Text(task!.content),
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
