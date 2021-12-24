import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mooday/models/notes/note.dart';
import 'dart:collection';

class NoteData extends ChangeNotifier {
  final List<Note> _notes = [
    Note(title: 'Example Note', description: 'Example Description'),
  ];

  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);

  int get notesLength => _notes.length;

  void addNote(String newNoteTitle, String newNoteDesc) {
    Note note = Note(title: newNoteTitle, description: newNoteDesc);
    _notes.add(note);
    notifyListeners();
  }
}
