import 'package:mooday/assets/utils.dart';

class Task {
  Task({this.isDone = false, required this.name, required this.date});

  bool isDone;
  final String name;
  DateTime date;

  void toggleDone() {
    isDone = !isDone;
  }

  static Task fromJson(Map<String, dynamic> json) => Task(
        date: Utils.toDateTime(json['date']),
        name: json['name'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'date': Utils.fromDateTimeToJson(date),
        'name': name,
        'isDone': isDone,
      };
}
