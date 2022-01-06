import 'package:flutter/material.dart';
import 'package:mooday/models/notes/note.dart';
import 'package:mooday/models/notes/note_data.dart';
import 'package:mooday/services/firebase/database.dart';
import 'package:provider/provider.dart';
import 'package:mooday/screens/notes/localwidgets/note_card.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DatabaseService().readNotes(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
                child: CircularProgressIndicator(color: Colors.black));
          default:
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<Note> note = snapshot.data;
              return Consumer<NoteData>(builder: (context, noteData, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return NoteCard(
                      noteTitle: note[index].title,
                      noteDesc: note[index].description,
                      onPressed: () {
                        noteData.deleteNote(note[index]);
                      },
                    );
                  },
                  itemCount: note.length,
                );
              });
            }
        }
      },
    );
  }
}
