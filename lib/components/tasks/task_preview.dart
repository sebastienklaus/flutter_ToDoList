import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({Key? key, required this.task}) : super(key: key);
  //constrcuteur
  final Task task;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: task.completed
          ? const Icon(Icons.check_box_outline_blank_rounded)
          : const Icon(Icons.check_box_rounded),
      title: Text(task.content),
      subtitle: Text('Created at ${task.createdAt}'),
      trailing: const Icon(Icons.drag_handle_rounded),
      onTap: () {},
    );
  }
}
