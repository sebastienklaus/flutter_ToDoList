import 'package:flutter/material.dart';
import 'package:todo_list/data/tasks.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster({Key? key, required dataTasks})
      : super(key: key); //constrcuteur

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.check_box_outline_blank_rounded),
            title: Text(tasks[index].content),
            subtitle: Text('Created at ${tasks[index].createdAt}'),
            trailing: const Icon(Icons.drag_handle_rounded),
          );
        },
      ),
    );
  }
}
