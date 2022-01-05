import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String email, String uid) {
    return users
        .add({'email': email, 'uid': uid})
        .then((value) => print('Added'))
        .catchError((error) => print('Error'));
  }
}
