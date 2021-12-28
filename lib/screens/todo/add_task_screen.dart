import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mooday/models/todo/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

final TextEditingController newTaskTitle = TextEditingController();

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(40.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              controller: newTaskTitle,
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle.text);
                Navigator.pop(context);
              },
              child: Text('Add'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.black,
                elevation: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
