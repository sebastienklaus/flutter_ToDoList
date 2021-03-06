import 'package:flutter/widgets.dart';
import 'package:todo_list/data/tasks.dart';
import 'package:todo_list/models/task.dart';
import 'package:dio/dio.dart';

class TasksCollection extends ChangeNotifier {
  final List<Task> _tasksList = tasks;

  Future getTasksDatasFromAPI() async {
    var response = await Dio().get('https://jsonplaceholder.typicode.com/todos',
        options: Options(headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json'
        }));

    if (response.statusCode == 200) {
      List data = response.data;
      _tasksList.addAll(data.map((i) => Task.fromJson(i)).toList());
      notifyListeners();
    }
  }

  Future delTaskAPI(int id) async {
    var response = await Dio()
        .delete("https://jsonplaceholder.typicode.com/todos/${id.toString()}",
            options: Options(headers: {
              Headers.contentTypeHeader: 'application/json',
              Headers.acceptHeader: 'application/json'
            }));

    return response.statusCode == 200;
  }

  List<Task> getAllTAsks() {
    return _tasksList;
  }

  void sortByName() {
    _tasksList.sort(
        ((a, b) => a.content.toLowerCase().compareTo(b.content.toLowerCase())));
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
