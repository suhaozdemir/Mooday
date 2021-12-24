import 'package:flutter/material.dart';
import 'package:mooday/models/notes/note_data.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController newNoteTitle = TextEditingController();
    final TextEditingController newNoteDesc = TextEditingController();

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TextField(
            controller: newNoteTitle,
          ),
          TextField(
            controller: newNoteDesc,
          ),
          TextButton(
              onPressed: () {
                Provider.of<NoteData>(context, listen: false)
                    .addNote(newNoteTitle.text, newNoteDesc.text);
                Navigator.pop(context);
              },
              child: Text('Add'))
        ],
      ),
    );
  }
}
