import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:todo_list/models/task.dart';
import 'package:todo_list/data/tasks.dart';

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
        // border: Border.all(width: 5, color: Colors.grey),
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
      // margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            'Titre de la tâche',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(task!.content),
          const Text(
            'Crée le :',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(newDate),
          CloseButton(
            // icon: const Icon(Icons.close),
            color: Colors.red,
            onPressed: () {
              onClose();
              // print(onClose);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    print('delete');
                    onRemove();
                  },
                  child: const Text('Delete')),
              ElevatedButton(
                  onPressed: () {
                    print('update');
                  },
                  child: const Text('Update')),
            ],
          )
        ],
      ),
    );
  }
}
