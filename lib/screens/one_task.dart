import 'package:flutter/material.dart';
import 'package:todo_list/components/tasks/task_form.dart';
import 'package:todo_list/models/task.dart';

class OneTask extends StatelessWidget {
  const OneTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Task? task = ModalRoute.of(context)!.settings.arguments as Task?;

    return Scaffold(
        appBar: AppBar(
          title: Text('Modifier la tâche "${task!.content}"'),
        ),
        body: TaskForm(taskToUpdate: task));
  }
}
