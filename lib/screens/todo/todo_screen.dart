import 'package:flutter/material.dart';
import 'package:mooday/screens/todo/localwidgets/todo_tile.dart';
import 'package:mooday/widgets/floating_button.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/screens/todo/localwidgets/todo_list.dart';
import 'package:mooday/screens/todo/add_task_screen.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, bottom: 30.0, right: 30.0),
          ),
          Center(
            child: Text(
              ktitleText,
              style: ktitleStyle.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 30.0),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              height: 300.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)),
              ),
              child: TodoList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingButton(
        scale: 1.2,
        title: 'Add',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
    );
  }
}
