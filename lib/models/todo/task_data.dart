import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mooday/models/todo/task.dart';
import 'package:mooday/services/firebase/database.dart';

class TaskData extends ChangeNotifier {
  void toggleTask(Task task) {
    task.isDone = !task.isDone;
    DatabaseService().updateTask(task);
  }

  void addTask(Task task) => DatabaseService().addTask(task);

  void removeTask(Task task) => DatabaseService().deleteTask(task);
}
