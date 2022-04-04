import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:todo_list/models/task.dart';
import 'package:todo_list/screens/one_task.dart';

import 'package:todo_list/tools/showSnackBar.dart';

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
    var createdDate =
        DateFormat.yMMMMd('fr_FR').format(task!.createdAt!); //date formating
    var expiredDate =
        DateFormat.yMMMMd('fr_FR').format(task!.expiredAt!); //date formating

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
          Text(
            DateFormat('dd-MM-yyyy').format(task!.expiredAt!),
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          // Text(task!.description),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Créée le $createdDate'),
              Text('Créée le $expiredDate'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      padding: const EdgeInsets.all(5),
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        //hide current snackbar
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        // snackBar of question about suppression or not & action
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBarMessage().validation(
                                'Êtes-vous sûr de supprimer cette tâche ?',
                                'Oui',
                                onRemove));
                      }),
                  IconButton(
                      padding: const EdgeInsets.all(5),
                      color: Colors.blue,
                      splashColor: Colors.green,
                      hoverColor: Colors.red,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.update),
                      onPressed: () {
                        Navigator.pushNamed(context, OneTask.route,
                            arguments: task);
                        onClose();
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
