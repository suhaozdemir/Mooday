import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mooday/models/notes/note.dart';
import 'package:mooday/models/todo/task.dart';
import 'package:mooday/models/mood/mood.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addUser(String email, String uid) async {
    CollectionReference users = _firestore.collection('Users');

    return await users
        .add({'email': email, 'uid': uid})
        .then((value) => print('Added'))
        .catchError((error) => print('Error'));
  }

  Future<void> addTask(Task task) async {
    DocumentReference tasks = _firestore
        .collection('Tasks')
        .doc(_auth.currentUser?.uid)
        .collection('userTasks')
        .doc();
    task.id = tasks.id;
    return await tasks
        .set(task.toJson())
        .then((value) => print('Task Added'))
        .catchError((error) => ('Task Error'));
  }

  Stream<List<Task>> readTasks() {
    Stream<QuerySnapshot<Object?>> querySnapshot = _firestore
        .collection('Tasks')
        .doc(_auth.currentUser?.uid)
        .collection('userTasks')
        .orderBy('date')
        .snapshots();

    Stream<List<Task>> task = querySnapshot.map((document) {
      return document.docs.map((e) {
        return Task.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
    });
    return task;
  }

  Future<void> updateTask(Task task) async {
    DocumentReference tasks = _firestore
        .collection('Tasks')
        .doc(_auth.currentUser?.uid)
        .collection('userTasks')
        .doc(task.id);

    return await tasks.update(task.toJson());
  }

  Future<void> deleteTask(Task task) {
    DocumentReference tasks = _firestore
        .collection('Tasks')
        .doc(_auth.currentUser?.uid)
        .collection('userTasks')
        .doc(task.id);

    return tasks
        .delete()
        .then((value) => print('Task Deleted'))
        .catchError((error) => ('Task Error'));
  }

  Future<void> addNote(Note note) async {
    DocumentReference notes = _firestore
        .collection('Notes')
        .doc(_auth.currentUser?.uid)
        .collection('userNotes')
        .doc();
    note.id = notes.id;
    return await notes
        .set(note.toJson())
        .then((value) => print('Note Added'))
        .catchError((error) => ('Note Error'));
  }

  Stream<List<Note>> readNotes() {
    Stream<QuerySnapshot<Object?>> querySnapshot = _firestore
        .collection('Notes')
        .doc(_auth.currentUser?.uid)
        .collection('userNotes')
        .orderBy('date')
        .snapshots();

    Stream<List<Note>> note = querySnapshot.map((document) {
      return document.docs.map((e) {
        return Note.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
    });
    return note;
  }

  Future<void> deleteNote(Note note) async {
    DocumentReference notes = _firestore
        .collection('Notes')
        .doc(_auth.currentUser?.uid)
        .collection('userNotes')
        .doc(note.id);

    return await notes.delete();
  }

  Future<void> addMood(Mood mood) async {
    DocumentReference moods = _firestore
        .collection('Moods')
        .doc(_auth.currentUser?.uid)
        .collection('userMoods')
        .doc();
    mood.id = moods.id;

    return await moods
        .set(mood.toJson())
        .then((completed) => print('Mood Added'));
  }

  Stream<List<Mood>> readMoods() {
    Stream<QuerySnapshot<Object?>> querySnapshot = _firestore
        .collection('Moods')
        .doc(_auth.currentUser?.uid)
        .collection('userMoods')
        .orderBy('date', descending: true)
        .snapshots();

    Stream<List<Mood>> mood = querySnapshot.map((document) {
      return document.docs.map((e) {
        return Mood.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
    });
    return mood;
  }
}
