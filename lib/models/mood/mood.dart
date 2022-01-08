class Mood {
  Mood({
    required this.name,
    required this.icon,
    required this.date,
    required this.hour,
    required this.id,
    required this.fulltime,
  });

  final String name;
  final String icon;
  final String date;
  final String hour;
  String id;
  final String fulltime;

  static Mood fromJson(Map<String, dynamic> json) => Mood(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        date: json['date'],
        hour: json['hour'],
        fulltime: json['fulltime'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'date': date,
        'hour': hour,
        'fulltime': fulltime,
      };
}
