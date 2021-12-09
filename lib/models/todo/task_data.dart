import 'package:flutter/foundation.dart';
import 'package:mooday/models/todo/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Task 1'),
    Task(name: 'Task 2'),
    Task(name: 'Task 3')
  ];

  int get tasksLength => tasks.length;
}
