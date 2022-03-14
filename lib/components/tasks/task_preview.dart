// CHILD OF TASK_MASTER
import 'package:flutter/material.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/models/task.dart';

import 'package:todo_list/tools/showSnackBar.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({Key? key, required this.task, required this.giveTaskData})
      : super(key: key);
  //constrcuteur

  final Task task;
  final Function giveTaskData;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        TasksCollection().deleteTask(task);
        //hide current snackbar
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
            snackBarMessage().success('Cette tâche à bien été supprimé'));
      },
      child: ListTile(
        leading: task.completed
            ? const Icon(Icons.check_box_rounded)
            : const Icon(Icons.check_box_outline_blank_rounded),
        title: task.completed
            ? Text(
                task.content,
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey),
              )
            : Text(task.content),
        subtitle: task.completed ? const Text('Fait') : const Text('A faire'),
        tileColor: task.completed ? Colors.grey[200] : null,
        trailing: const Icon(Icons.drag_handle_rounded),
        onTap: () {
          //on remonte TaskData vers task_master
          giveTaskData(task);
        },
      ),
    );
  }
}
