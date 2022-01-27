import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({Key? key, required this.task}) : super(key: key);
  //constrcuteur
  final Task task;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              task.content,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'Created at ${task.createdAt}',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                task.completed
                    ? const Text(
                        'Task completed',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    : const Text(
                        'Task in progress',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
