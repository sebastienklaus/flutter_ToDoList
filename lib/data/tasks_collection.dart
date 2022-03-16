import 'package:flutter/widgets.dart';
import 'package:todo_list/data/tasks.dart';
import 'package:todo_list/models/task.dart';

class TasksCollection extends ChangeNotifier {
  final List<Task> _tasksList = tasks;

  List<Task> getAllTAsks() {
    return _tasksList;
  }

  void sortByName() {
    _tasksList.sort(((a, b) => a.content.compareTo(b.content)));
    notifyListeners();
  }

  void sortByStatus() {
    _tasksList.sort((a, b) {
      if (a.completed == b.completed) {
        return 0;
      } else if (b.completed) {
        return -1;
      }
      return 1;
    });
    notifyListeners();
  }

  int lengthListTasks() {
    return _tasksList.length;
  }

  void createTask(Task task) {
    _tasksList.add(task);
    notifyListeners();
  }

  void updateTask(Task newTask) {
    _tasksList[_tasksList.indexWhere((item) => item.id == newTask.id)] =
        newTask;
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasksList.removeWhere((item) => item.id == task.id);
    notifyListeners();
  }
}
