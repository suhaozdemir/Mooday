import 'package:flutter/material.dart';
import 'package:mooday/models/notes/note.dart';
import 'package:mooday/models/notes/note_data.dart';
import 'package:mooday/services/firebase/database.dart';
import 'package:provider/provider.dart';
import 'package:mooday/screens/notes/localwidgets/note_card.dart';
import 'package:mooday/assets/constants.dart';

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
              if (note.length == 0) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cannot find any Note, click add for new.',
                        style: STYLE_TITLE.copyWith(fontSize: 20),
                      ),
                      Image.asset(
                        'assets/images/empty/note_empty.png',
                        scale: 1,
                      ),
                    ]);
              }
              return Consumer<NoteData>(builder: (context, noteData, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return NoteCard(
                      noteTitle: note[index].title,
                      noteDesc: note[index].description,
                      onPressed: () {
                        noteData.deleteNote(note[index]);
                        DatabaseService()
                            .addLog('DELETED NOTE: [${note[index].title}]');
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
