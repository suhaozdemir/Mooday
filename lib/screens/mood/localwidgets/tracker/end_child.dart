import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';

class EndChild extends StatelessWidget {
  const EndChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: ListTile(
          title: Text(
            'Good',
            style: const TextStyle(
                fontFamily: 'Oswald', fontWeight: FontWeight.bold),
          ),
          subtitle: Text('02.04 AM'),
          trailing: Image.asset('assets/images/moods/goodmood.png'),
        ),
        decoration: const BoxDecoration(
          color: THEME_COLOR_2,
        ),
      ),
    );
  }
}
