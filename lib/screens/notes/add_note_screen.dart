import 'package:flutter/material.dart';
import 'package:mooday/models/notes/note.dart';
import 'package:mooday/models/notes/note_data.dart';
import 'package:provider/provider.dart';
import 'package:mooday/assets/constants.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

final TextEditingController newNoteTitle = TextEditingController();
final TextEditingController newNoteDesc = TextEditingController();

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('TITLE', style: STYLE_TITLE.copyWith(fontSize: 17.0)),
            const SizedBox(height: 5.0),
            TextField(
              autofocus: true,
              controller: newNoteTitle,
              decoration: DECORATION_TEXT_FILE_2,
            ),
            const SizedBox(height: 10.0),
            Text(
              'DESCRIPTION',
              style: STYLE_TITLE.copyWith(fontSize: 17.0),
            ),
            const SizedBox(height: 5.0),
            TextField(
                maxLines: 10,
                controller: newNoteDesc,
                decoration:
                    DECORATION_TEXT_FILE_2.copyWith(hintText: 'Enter a Note')),
            TextButton(
                onPressed: () {
                  if (newNoteTitle.text.isNotEmpty) {
                    addNote();
                    Navigator.pop(context);
                    newNoteTitle.clear();
                    newNoteDesc.clear();
                  } else {
                    print('Empty');
                  }
                },
                child: const Text('Add'),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.black,
                    elevation: 20.0))
          ],
        ),
      ),
    );
  }

  void addNote() {
    final note = Note(
        id: DateTime.now().toString(),
        date: DateTime.now(),
        title: newNoteTitle.text,
        description: newNoteDesc.text);
    Provider.of<NoteData>(context, listen: false).addNote(note);
  }
}
