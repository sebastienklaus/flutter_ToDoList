import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/data/tasks_collection.dart';
import 'package:todo_list/models/task.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key, required this.taskToUpdate}) : super(key: key);

  final Task? taskToUpdate;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  late bool checkedValue;
  // * controller(s) about the input
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tâche terminée',
                style: TextStyle(fontSize: 16),
              ),
              Checkbox(
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue!;
                  });
                },
              )
            ],
          ),
          Consumer<TasksCollection>(
            builder: (context, tasksCollection, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tâche ajoutée !')),
                      );
                      tasksCollection.updateTask(Task(
                          widget.taskToUpdate!.id,
                          taskNameController.text,
                          checkedValue,
                          DateTime.now()));
                      Navigator.popAndPushNamed(context, '/all_tasks');
                    }
                  },
                  child: const Text('Submit'),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
