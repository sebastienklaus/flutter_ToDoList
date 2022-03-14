import 'package:flutter/material.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/models/task.dart';

import 'package:todo_list/tools/showSnackBar.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key, this.taskToUpdate, required this.onChangeTask})
      : super(key: key);

  final Task? taskToUpdate;
  final Function onChangeTask;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool checkedValue;

  // * controller(s) about the input(s)
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.taskToUpdate != null) {
      taskNameController =
          TextEditingController(text: widget.taskToUpdate!.content);
      taskDescriptionController =
          TextEditingController(text: widget.taskToUpdate!.description);
      checkedValue = widget.taskToUpdate!.completed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.taskToUpdate != null
            ? Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            value: checkedValue,
                            onChanged: (newValue) {
                              setState(() {
                                checkedValue = newValue!;
                              });
                            },
                            shape:
                                const CircleBorder(side: BorderSide(width: 2)),
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: taskNameController,
                              // The validator receives the text that the user has entered.
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // labelText: 'Nom de la tâche',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez insérer du texte';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: taskDescriptionController,
                        // The validator receives the text that the user has entered.
                        decoration: InputDecoration(
                          labelText: 'Description',
                          //border when input is enable
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          //border when user clicked on it
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                        ),
                        minLines: 1,
                        maxLines: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez insérer du texte';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              widget.onChangeTask(Task(
                                  widget.taskToUpdate!.id,
                                  taskNameController.text,
                                  taskDescriptionController.text,
                                  checkedValue,
                                  DateTime.now()));
                              Navigator.pop(context);
                              //hide current snackbar
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackBarMessage().info(
                                      'Une tâche vient d\'être modifiée'));
                            }
                          },
                          child: const Text('Sauvegarder'),
                        ),
                      )
                    ]),
              )
            : Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: taskNameController,
                        // The validator receives the text that the user has entered.
                        decoration: InputDecoration(
                          labelText: 'Nom',
                          //border when input is enable
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          //border when user clicked on it
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez insérer du texte';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: taskDescriptionController,
                        // The validator receives the text that the user has entered.
                        decoration: InputDecoration(
                          labelText: 'Description',
                          //border when input is enable
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          //border when user clicked on it
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                        ),
                        minLines: 1,
                        maxLines: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez insérer du texte';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              widget.onChangeTask(
                                  taskNameController.text,
                                  taskDescriptionController.text,
                                  false,
                                  DateTime.now());
                              Navigator.pop(context);
                              //hide current snackbar
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackBarMessage().success(
                                      'Création d\'une tâche réussie !'));
                            } else {
                              //hide current snackbar
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackBarMessage().danger(
                                      'Un ou plusieurs champs du formulaire sont incorrects'));
                            }
                          },
                          child: const Text('Sauvegarder'),
                        ),
                      )
                    ]),
              ));
  }
}
