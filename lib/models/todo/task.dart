import 'package:mooday/assets/utils.dart';

class Task {
  Task(
      {required this.id,
      this.isDone = false,
      required this.name,
      required this.date});

  String id;
  bool isDone;
  final String name;
  DateTime date;

  static Task fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        date: Utils.toDateTime(json['date']),
        name: json['name'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': Utils.fromDateTimeToJson(date),
        'name': name,
        'isDone': isDone,
      };
}
