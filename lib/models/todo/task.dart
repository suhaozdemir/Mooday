class Task {
  Task({this.isDone = false, required this.name});

  bool isDone;
  final String name;

  void toggleDone() {
    isDone = !isDone;
  }

  static Task fromJson(Map<String, dynamic> json) => Task(
        name: json['title'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'isDone': isDone,
      };
}
