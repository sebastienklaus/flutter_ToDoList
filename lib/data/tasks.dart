import 'package:flutter/material.dart';

import 'package:todo_list/models/task.dart';

late List<Task> listTask = [
  Task(1, 'Task n°1', false, DateTime.now()),
  Task(2, 'Task n°2', false, DateTime.now()),
  Task(3, 'Task n°3', false, DateTime.now()),
  Task(4, 'Task n°4', true, DateTime.now()),
  Task(5, 'Task n°5', true, DateTime.now()),
];
