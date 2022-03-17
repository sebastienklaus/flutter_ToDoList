import 'package:flutter/material.dart';
import 'package:todo_list/components/tasks/task_form.dart';

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
        body: const TaskForm());
  }
}
