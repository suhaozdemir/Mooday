import 'package:mooday/assets/utils.dart';

class Note {
  Note(
      {required this.id,
      required this.date,
      required this.title,
      required this.description});

  String id;
  DateTime date;
  final String title;
  final String description;

  static Note fromJson(Map<String, dynamic> json) => Note(
      id: json['id'],
      date: Utils.toDateTime(json['date']),
      title: json['title'],
      description: json['description']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': Utils.fromDateTimeToJson(date),
        'title': title,
        'description': description,
      };
}
