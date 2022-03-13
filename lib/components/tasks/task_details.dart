import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:todo_list/models/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails(
      {Key? key,
      required this.task,
      required this.onClose,
      required this.onRemove})
      : super(key: key);

  //constrcuteur
  final Task? task;
  final Function onClose;
  final Function onRemove;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(); //to change the dte US into FR
    var newDate =
        DateFormat.yMMMMd('fr_FR').format(task!.createdAt); //date formating

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.close),
                color: Colors.red,
                onPressed: () {
                  //callback in allTasks (after that, there is a setState ...)
                  onClose();
                },
              ),
            ],
          ),
          Text(
            task!.content,
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(task!.description),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  label: const Text('Supprimer'),
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text(
                          'Êtes-vous sûr de supprimer cette tâche ?'),
                      duration: const Duration(seconds: 10),
                      action: SnackBarAction(
                        label: 'Oui',
                        onPressed: () {
                          //callback in allTasks (after that, there is a setState ...)
                          onRemove();
                        },
                      ),
                    );
                    // snackBar of question about suppression or not
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }),
              ElevatedButton.icon(
                  label: const Text('Modifier'),
                  icon: const Icon(Icons.update),
                  onPressed: () {
                    Navigator.pushNamed(context, '/one_task', arguments: task);
                    onClose();
                  }),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'Créée le $newDate',
            ),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
