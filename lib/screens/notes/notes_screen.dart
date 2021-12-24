import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/screens/notes/localwidgets/note_list.dart';
import 'package:mooday/widgets/floating_button.dart';
import 'package:mooday/screens/notes/add_note_screen.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, bottom: 30.0, right: 30.0),
          ),
          Center(
            child: Text(
              TEXT_TITLE,
              style: STYLE_TITLE.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 30.0),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              height: 300.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)),
              ),
              child: NoteList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingButton(
          scale: 1.2,
          title: 'Add',
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => AddNoteScreen());
          }),
    );
  }
}
