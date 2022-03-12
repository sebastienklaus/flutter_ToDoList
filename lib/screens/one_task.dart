import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/tasks/task_form.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/models/task.dart';

class OneTask extends StatefulWidget {
  const OneTask({Key? key}) : super(key: key);

  @override
  State<OneTask> createState() => _OneTaskState();
}

class _OneTaskState extends State<OneTask> {
  // * int actionCreate = 1;
  // * int actionUpdate = 2;

  @override
  Widget build(BuildContext context) {
    final Task? task = ModalRoute.of(context)!.settings.arguments as Task?;

    return Scaffold(
        appBar: AppBar(
          title: Text('Modifier la tâche "${task!.content}"'),
        ),
        body: Consumer<TasksCollection>(
            builder: (context, tasksCollection, child) {
          return TaskForm(
            typeOfAction: 2,
            taskToUpdate: task,
            onChangeTask: (newTask) {
              setState(() {
                tasksCollection.updateTask(newTask);
              });
            },
          );
        }));
  }
}
