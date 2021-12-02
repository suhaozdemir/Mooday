import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
  });

  final String taskTitle;
  final bool isChecked;
  final void Function(bool?) checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          onChanged: null,
          value: isChecked,
        ),
      ),
      decoration: BoxDecoration(
        color: ktheme2color,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
