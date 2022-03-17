import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/models/task.dart';

import 'package:todo_list/tools/showSnackBar.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key, this.taskToUpdate}) : super(key: key);

  final Task? taskToUpdate;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // * controller(s) about the input(s)
  TextEditingController taskNameController = TextEditingController();
  // * check value about completed attribute
  late bool checkedValue;

  @override
  void initState() {
    super.initState();
    if (widget.taskToUpdate != null) {
      // * si on reçoit une task (par exemple depuis One_Task())
      taskNameController =
          TextEditingController(text: widget.taskToUpdate!.content);
      checkedValue = widget.taskToUpdate!.completed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[100],
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.taskToUpdate != null
                            ? Checkbox(
                                value: checkedValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValue = newValue!;
                                  });
                                },
                                shape: const CircleBorder(
                                    side: BorderSide(width: 2)),
                              )
                            : Container(),
                        Flexible(
                          child: TextFormField(
                            controller: taskNameController,
                            // The validator receives the text that the user has entered.
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white60,
                              alignLabelWithHint: true,
                              labelStyle: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                              labelText: 'Nom',
                              //border when input is enable
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.2),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              //border when user clicked on it
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez insérer un nom de tâche valide.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Consumer<TasksCollection>(
                            builder: (context, tasksCollection, child) {
                          return ElevatedButton(
                            onPressed: () {
                              // * si on reçoit une task (par exemple depuis One_Task())
                              if (widget.taskToUpdate != null) {
                                if (_formKey.currentState!.validate()) {
                                  tasksCollection.updateTask(Task(
                                      widget.taskToUpdate!.id,
                                      taskNameController.text,
                                      checkedValue,
                                      DateTime.now()));
                                  Navigator.pop(context);
                                  //hide current snackbar
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackBarMessage().info(
                                          'Une tâche vient d\'être modifiée'));
                                } else {
                                  //hide current snackbar
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackBarMessage().danger(
                                          'Un ou plusieurs champs du formulaire sont incorrects.'));
                                }
                              } else {
                                if (_formKey.currentState!.validate()) {
                                  int id = tasksCollection.lengthListTasks();
                                  tasksCollection.createTask(Task(
                                      id,
                                      taskNameController.text,
                                      false,
                                      DateTime.now()));
                                  Navigator.pop(context);
                                  //hide current snackbar
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackBarMessage().success(
                                          'Création d\'une tâche effectuée !'));
                                } else {
                                  //hide current snackbar
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackBarMessage().danger(
                                          'Un ou plusieurs champs du formulaire sont incorrects.'));
                                }
                              }
                            },
                            child: const Text('Sauvegarder'),
                          );
                        }))
                  ]),
            )));
  }
}
