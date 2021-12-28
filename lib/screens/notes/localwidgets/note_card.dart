import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/models/notes/note_data.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {required this.noteTitle,
      required this.noteDesc,
      required this.onPressed});

  final String noteTitle;
  final String noteDesc;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        title: Text(
          noteTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(noteDesc),
        trailing: IconButton(onPressed: onPressed, icon: Icon(Icons.delete)),
      ),
      decoration: const BoxDecoration(
        color: THEME_COLOR_2,
      ),
    );
  }
}
