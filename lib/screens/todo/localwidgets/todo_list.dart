import 'package:flutter/material.dart';
import 'todo_tile.dart';
import 'package:mooday/models/todo/task_data.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TodoTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback: (checkboxCallback) {
              taskData.toggleTask(task);
            },
            longPressCallback: () {
              taskData.removeTask(task);
            },
          );
        },
        itemCount: taskData.tasksLength,
      );
    });
  }
}
