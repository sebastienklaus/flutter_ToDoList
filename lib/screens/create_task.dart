import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/tasks/task_form.dart';
import 'package:todo_list/data/tasks_collection.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  // * int actionCreate = 1;
  // * int actionUpdate = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Créer une nouvelle tâche'),
        ),
        body: Consumer<TasksCollection>(
            builder: (context, tasksCollection, child) {
          return TaskForm(
            typeOfAction: 1,
            onChangeTask: (newTask) {
              setState(() {
                tasksCollection.createTask(newTask);
              });
            },
          );
        }));
  }
}
