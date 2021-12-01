import 'package:flutter/material.dart';
import 'package:mooday/screens/mood/localwidgets/mood_icons.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MoodIcons(
              title: 'Happy',
              moodImg: 'assets/images/moods/mood.png',
              onTap: () {},
            ),
            MoodIcons(
                title: 'Good',
                moodImg: 'assets/images/moods/goodmood.png',
                onTap: () {}),
            MoodIcons(
                title: 'Neutral',
                moodImg: 'assets/images/moods/neutralmood.png',
                onTap: () {}),
            MoodIcons(
                title: 'Sad',
                moodImg: 'assets/images/moods/sadmood.png',
                onTap: () {}),
            MoodIcons(
                title: 'Bad',
                moodImg: 'assets/images/moods/crymood.png',
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
