import 'package:flutter/material.dart';
import 'package:mooday/services/firebase/database.dart';
import 'todo_tile.dart';
import 'package:mooday/models/todo/task.dart';
import 'package:mooday/models/todo/task_data.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DatabaseService().readTasks(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
                child: CircularProgressIndicator(color: Colors.black));
          default:
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<Task> task = snapshot.data;
              return Consumer<TaskData>(builder: (context, taskData, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return TodoTile(
                      taskTitle: task[index].name,
                      isChecked: task[index].isDone,
                      checkboxCallback: (checkboxCallback) {
                        taskData.toggleTask(task[index]);
                      },
                      longPressCallback: () {
                        taskData.removeTask(task[index]);
                      },
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              });
            }
        }
      },
    );
  }
}
