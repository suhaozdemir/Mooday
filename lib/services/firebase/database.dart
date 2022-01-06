import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mooday/models/todo/task.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String email, String uid) async {
    CollectionReference users = _firestore.collection('Users');

    return await users
        .add({'email': email, 'uid': uid})
        .then((value) => print('Added'))
        .catchError((error) => print('Error'));
  }

  Future<void> addTask(Task task) async {
    DocumentReference tasks = _firestore.collection('Tasks').doc();

    return await tasks
        .set(task.toJson())
        .then((value) => print('Task Added'))
        .catchError((error) => ('Task Error'));
  }

  Stream<List<Task>> readTasks() {
    Stream<QuerySnapshot<Object?>> querySnapshot =
        _firestore.collection('Tasks').snapshots();

    Stream<List<Task>> task = querySnapshot.map((document) {
      return document.docs.map((e) {
        return Task.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
    });
    return task;
  }
}
