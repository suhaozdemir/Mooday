import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          Text('TITLE', style: STYLE_TITLE.copyWith(fontSize: 17.0)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 2,
              autofocus: true,
              controller: newNoteTitle,
              decoration: DECORATION_TEXT_FILE_2,
            ),
          ),
          Text(
            'DESCRIPTION',
            style: STYLE_TITLE.copyWith(fontSize: 17.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                maxLines: 5,
                controller: newNoteDesc,
                decoration:
                    DECORATION_TEXT_FILE_2.copyWith(hintText: 'Enter a Note')),
          ),
          TextButton(
              onPressed: () {
                Provider.of<NoteData>(context, listen: false)
                    .addNote(newNoteTitle.text, newNoteDesc.text);
                Navigator.pop(context);
                newNoteTitle.clear();
                newNoteDesc.clear();
              },
              child: Text('Add'),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.black,
                  elevation: 20.0))
        ],
      ),
    );
  }
}
