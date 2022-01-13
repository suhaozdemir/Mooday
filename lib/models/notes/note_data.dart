import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mooday/models/notes/note.dart';
import 'package:mooday/services/firebase/database.dart';

class NoteData extends ChangeNotifier {
  void addNote(Note note) => DatabaseService().addNote(note);
  void deleteNote(Note note) => DatabaseService().deleteNote(note);
}
