// CHILD OF TASK_MASTER
import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({Key? key, required this.task, required this.giveTaskData})
      : super(key: key);
  //constrcuteur

  final Task task;
  final Function giveTaskData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: task.completed
          ? const Icon(Icons.check_box_rounded)
          : const Icon(Icons.check_box_outline_blank_rounded),
      title: task.completed
          ? Text(
              task.content,
              style: const TextStyle(decoration: TextDecoration.lineThrough),
            )
          : Text(task.content),
      subtitle: task.completed ? const Text('Fait') : const Text('A faire'),
      tileColor: task.completed ? Colors.green[100] : null,
      trailing: const Icon(Icons.drag_handle_rounded),
      onTap: () {
        //on remonte TaskData vers task_master
        giveTaskData(task);
      },
    );
  }
}
