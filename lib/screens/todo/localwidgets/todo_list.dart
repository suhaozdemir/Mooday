import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
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
              if (task.length == 0) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'All tasks are completed!',
                        style: STYLE_TITLE.copyWith(fontSize: 20),
                      ),
                      Image.asset(
                        'assets/images/empty/todo_empty.png',
                        scale: 1,
                      ),
                    ]);
              }
              return Consumer<TaskData>(builder: (context, taskData, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return TodoTile(
                      taskTitle: task[index].name,
                      isChecked: task[index].isDone,
                      checkboxCallback: (checkboxCallback) {
                        taskData.toggleTask(task[index]);
                        DatabaseService()
                            .addLog('UPDATED TASK: [${task[index].name}]');
                      },
                      longPressCallback: () {
                        taskData.removeTask(task[index]);
                        DatabaseService()
                            .addLog('DELETED TASK: [${task[index].name}]');
                      },
                    );
                  },
                  itemCount: task.length,
                );
              });
            }
        }
      },
    );
  }
}
