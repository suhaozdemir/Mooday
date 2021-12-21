import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  final String taskTitle;
  final bool isChecked;
  final VoidCallback longPressCallback;
  final void Function(bool?) checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onLongPress: longPressCallback,
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.black,
          onChanged: checkboxCallback,
          value: isChecked,
        ),
      ),
      decoration: BoxDecoration(
        color: THEME_COLOR_2,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
