import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';

class EndChild extends StatelessWidget {
  EndChild(
      {required this.moodName,
      required this.moodHour,
      required this.moodIcon,
      required this.longPressCallback});
  final String moodName;
  final String moodIcon;
  final String moodHour;
  final VoidCallback longPressCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: ListTile(
          onLongPress: longPressCallback,
          title: Text(
            moodName,
            style: const TextStyle(
                fontFamily: 'Oswald', fontWeight: FontWeight.bold),
          ),
          subtitle: Text(moodHour),
          trailing: Image.asset(moodIcon),
        ),
        decoration: const BoxDecoration(
          color: THEME_COLOR_2,
        ),
      ),
    );
  }
}
