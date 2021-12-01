import 'package:flutter/material.dart';

class MoodIcons extends StatelessWidget {
  MoodIcons({required this.title, required this.moodImg, required this.onTap});

  final String title;
  final String moodImg;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: onTap, child: Image.asset(moodImg)),
        Text(title),
      ],
    );
  }
}
