// PARENT OF TASK_PREVIEW
import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/components/tasks/task_preview.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster(
      {Key? key, required this.dataTasks, required this.giveTaskToAllTasks})
      : super(key: key); //constrcuteur

  final List<Task> dataTasks;
  final Function giveTaskToAllTasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: 0.0,
      itemCount: dataTasks.length,
      itemBuilder: (context, index) {
        return TaskPreview(
          task: dataTasks[index],
          //on récupère giveTaskData de task_preview
          giveTaskData: (Task val) {
            //on remonte cette fonction vers all_task
            giveTaskToAllTasks(val);
          },
        );
      },
    );
  }
}
