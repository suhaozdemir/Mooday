class Task {
  Task({this.isDone = false, required this.name});

  bool isDone;
  final String name;

  void toggleDone() {
    isDone != isDone;
  }
}
