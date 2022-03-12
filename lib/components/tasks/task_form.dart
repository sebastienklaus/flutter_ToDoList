import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

import 'package:todo_list/tools/showSnackBar.dart';

class TaskForm extends StatefulWidget {
  const TaskForm(
      {Key? key,
      required this.typeOfAction,
      this.taskToUpdate,
      required this.onChangeTask})
      : super(key: key);

  final int typeOfAction;
  final Task? taskToUpdate;
  final Function onChangeTask;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  late bool checkedValue;
  // * controller(s) about the input(s)
  TextEditingController taskNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskNameController =
        TextEditingController(text: widget.taskToUpdate!.content);
    checkedValue = widget.taskToUpdate!.completed;
  }

  @override
  Widget build(BuildContext context) {
    // if it's an action of Create, then
    if (widget.typeOfAction == 1) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        )),
      );
    }
    // if else this is an action of Update
    else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  shape: const CircleBorder(side: BorderSide(width: 2)),
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
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    widget.onChangeTask(Task(widget.taskToUpdate!.id,
                        taskNameController.text, checkedValue, DateTime.now()));
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(snackBarMessage()
                        .info('Une tâche vient d\'être modifiée'));
                  }
                },
                child: const Text('Submit'),
              ),
            )
          ]),
        ),
      );
    }
  }
}
// const SnackBar(
//                         backgroundColor: Color(0xff17a2b8),
//                         content: Text('Tâche modifiée !')),
//                   );