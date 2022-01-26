import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  late int id; //id of task
  late String content; //content of the task
  late bool completed; //bool if the task is complete or not
  late DateTime createdAt; //time of creation of task

  Task(this.id, this.content, this.completed, this.createdAt, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
