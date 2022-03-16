import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/tasks/task_form.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/models/task.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  static String get route => '/create_task';

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
              onChangeTask: (name, description, complete, date) {
                setState(() {
                  int id = tasksCollection.lengthListTasks();
                  Task task = Task(id, name, complete, date);
                  // Task task = Task(id, name, description, complete, date);
                  tasksCollection.createTask(task);
                });
              },
            );
          },
        ));
  }
}
