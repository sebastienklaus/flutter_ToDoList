import 'package:flutter/material.dart';
import 'package:todo_list/data/tasks.dart' as data;
import 'package:todo_list/models/task.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key}) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay? time = const TimeOfDay(hour: 12, minute: 12);
  TextEditingController taskNameController = TextEditingController();
  TextEditingController timeCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une tâche'),
      ),
      body: Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            controller: taskNameController,
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
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tâche ajoutée !')),
                  );
                  int index = data.tasks.length;

                  Navigator.pop(
                      context,
                      Task(index, taskNameController.text, false,
                          DateTime.now()));
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ]),
      ),
    );
  }
}
