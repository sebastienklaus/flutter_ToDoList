import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/tasks/task_form.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/models/task.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Créer une nouvelle tâche'),
        ),
        body: Consumer<TasksCollection>(
          builder: (context, tasksCollection, child) {
            return TaskForm(
              onChangeTask: (Task newTask) {
                setState(() {
                  tasksCollection.createTask(newTask);
                });
              },
            );
          },
        ));
  }
}
