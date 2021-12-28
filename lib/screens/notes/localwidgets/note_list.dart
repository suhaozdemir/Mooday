import 'package:flutter/material.dart';
import 'package:mooday/models/notes/note_data.dart';
import 'package:provider/provider.dart';
import 'package:mooday/screens/notes/localwidgets/note_card.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(builder: (context, noteData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final note = noteData.notes[index];
          return NoteCard(
            noteTitle: note.title,
            noteDesc: note.description,
            onPressed: () {
              noteData.deleteNote(note);
            },
          );
        },
        itemCount: noteData.notesLength,
      );
    });
  }
}
