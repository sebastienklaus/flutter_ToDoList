import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key, required this.taskToUpdate}) : super(key: key);

  final Task? taskToUpdate;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay? time = const TimeOfDay(hour: 12, minute: 12);
  TextEditingController taskNameController = TextEditingController();
  TextEditingController timeCtl = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskNameController =
        TextEditingController(text: widget.taskToUpdate!.content);
  }

  @override
  Widget build(BuildContext context) {
    taskNameController.text = widget.taskToUpdate!.content;
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextFormField(
          controller: taskNameController,
          // initialValue: taskNameController.text,
          // The validator receives the text that the user has entered.
          decoration: const InputDecoration(labelText: 'Nom de la tâche'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        // filed for pick DateTime
        // TextFormField(
        //   controller: timeCtl,
        //   onTap: () async {
        //     TimeOfDay? newTime =
        //         await showTimePicker(context: context, initialTime: time!);
        //     if (newTime != null && newTime != time) {
        //       timeCtl.text = newTime.format(context);
        //       setState(() {
        //         time = newTime;
        //       });
        //     }
        //   },
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'The value of date is wrong !';
        //     }
        //     return null;
        //   },
        //   decoration: const InputDecoration(labelText: 'Choose a datetime'),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                print(taskNameController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tâche ajoutée !')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ),
      ]),
    );
  }
}
