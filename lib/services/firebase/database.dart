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

  Future<void> addTask(Task task, String uid) async {
    DocumentReference tasks = _firestore.collection('Tasks').doc(uid);

    return await tasks
        .set(task.toJson())
        .then((value) => print('Task Added'))
        .catchError((error) => ('Task Error'));
  }
}
