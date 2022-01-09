import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';

class MoodIcons extends StatelessWidget {
  MoodIcons({required this.title, required this.moodImg, required this.onTap});

  final String title;
  final String moodImg;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              onTap();
              Navigator.pushNamed(context, ROUTE_MOOD_TRACKER);
            },
            child: Image.asset(
              moodImg,
              scale: 1.2,
            )),
        Text(title),
      ],
    );
  }
}
