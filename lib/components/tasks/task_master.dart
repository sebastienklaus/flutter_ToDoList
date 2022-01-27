import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/components/tasks/task_preview.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster({Key? key, required this.dataTasks}) : super(key: key);
  //constrcuteur
  final List<Task> dataTasks;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: dataTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.check_box_outline_blank_rounded),
            title: Text(dataTasks[index].content),
            subtitle: Text('Created at ${dataTasks[index].createdAt}'),
            trailing: const Icon(Icons.drag_handle_rounded),
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return TaskPreview(task: dataTasks[index]);
                  });
            },
          );
        },
      ),
    );
  }
}
