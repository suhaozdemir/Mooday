import 'package:mooday/assets/utils.dart';

class Mood {
  Mood({
    required this.name,
    required this.icon,
    required this.date,
    required this.hour,
    required this.id,
    required this.time,
  });

  final String name;
  final String icon;
  final String date;
  final String hour;
  String id;
  final DateTime time;

  static Mood fromJson(Map<String, dynamic> json) => Mood(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        date: json['date'],
        hour: json['hour'],
        time: Utils.toDateTime(json['time']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'date': date,
        'hour': hour,
        'time': Utils.fromDateTimeToJson(time)
      };
}
