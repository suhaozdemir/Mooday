import 'package:flutter/material.dart';
import 'todo_tile.dart';
import 'package:mooday/models/todo/task_data.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TodoTile(
          taskTitle: Provider.of<TaskData>(context).tasks[index].name,
          isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
          checkboxCallback: (c) {},
        );
      },
      itemCount: Provider.of<TaskData>(context).tasksLength,
    );
  }
}
