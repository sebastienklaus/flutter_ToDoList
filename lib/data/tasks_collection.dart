import 'package:flutter/widgets.dart';
import 'package:todo_list/data/tasks.dart';
import 'package:todo_list/models/task.dart';

class TasksCollection extends ChangeNotifier {
  final List<Task> _tasksList = tasks;

  List<Task> getAllTAsks() {
    return _tasksList;
  }

  void createTask(Task task) {
    _tasksList.add(task);
    notifyListeners();
  }

  void updateTask() {}

  void deleteTask(Task task) {
    tasks.removeWhere((item) => item.id == task!.id);
  }
}
