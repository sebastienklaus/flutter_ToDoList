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
          ? const Icon(Icons.check_box_outline_blank_rounded)
          : const Icon(Icons.check_box_rounded),
      title: Text(task.content),
      subtitle: Text('Created at ${task.createdAt}'),
      enabled: task.completed ? true : false,
      tileColor: task.completed ? null : Colors.green[100],
      trailing: const Icon(Icons.drag_handle_rounded),
      onTap: () {
        giveTaskData(task);
      },
    );
  }
}
