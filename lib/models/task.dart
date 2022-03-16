import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  int id; //id of task
  String content; //content of the task
  // String description;
  bool completed; //bool if the task is complete or not
  DateTime createdAt; //time of creation of task

  Task(this.id, this.content, this.completed, this.createdAt, {Key? key})
      : super(key: key);
  // Task(this.id, this.content, this.description, this.completed, this.createdAt,
  //     {Key? key})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
