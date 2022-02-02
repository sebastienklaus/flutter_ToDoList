import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({Key? key, required this.task}) : super(key: key);
  //constrcuteur
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text('Created at'),
              Text('${task.createdAt}'),
            ],
          ),
          Row(
            children: <Widget>[
              const Text('Task is done ?'),
              Text('${task.completed}'),
            ],
          ),
        ],
      ),
    );
  }
}
