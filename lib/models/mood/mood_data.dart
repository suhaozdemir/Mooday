import 'package:flutter/cupertino.dart';
import 'package:mooday/services/firebase/database.dart';
import 'mood.dart';

class MoodData extends ChangeNotifier {
  void addMood(Mood mood) => DatabaseService().addMood(mood);
}
