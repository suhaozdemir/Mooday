import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.noteTitle,
    required this.noteDesc,
  });

  final String noteTitle;
  final String noteDesc;

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
      ),
      decoration: const BoxDecoration(
        color: THEME_COLOR_2,
      ),
    );
  }
}
