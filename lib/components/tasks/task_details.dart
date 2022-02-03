import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({Key? key, required this.task}) : super(key: key);
  //constrcuteur
  final Task task;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(); //to change the dte US into FR
    var newDate =
        DateFormat.yMMMMd('fr_FR').format(task.createdAt); //date formating

    return Expanded(
      child: Container(
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
          children: <Widget>[
            Column(
              children: [
                Row(
                  children: const <Widget>[
                    Text(
                      'Content',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(task.content),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Creation date',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(newDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // color: Colors.grey[200],
    );
  }
}
