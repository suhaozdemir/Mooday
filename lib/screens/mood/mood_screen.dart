import 'package:flutter/material.dart';
import 'package:mooday/screens/mood/localwidgets/mood_icons.dart';

class MoodScreen extends StatefulWidget {
  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  late DateTime pickedDate;
  late TimeOfDay pickedTime;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    pickedTime = TimeOfDay.now();
    print(pickedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: Text(
                      'Date: ${pickedDate.day}, ${pickedDate.month}, ${pickedDate.year},'),
                  onPressed: _pickDate,
                ),
                TextButton(
                  child:
                      Text('Time: ${pickedTime.hour} : ${pickedTime.minute}'),
                  onPressed: _pickTime,
                ),
              ],
            ),
          ),
          Center(
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
        ],
      ),
    );
  }

  _pickDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime.now());

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  _pickTime() async {
    TimeOfDay? time =
        await showTimePicker(context: context, initialTime: pickedTime);

    if (time != null) {
      setState(() {
        pickedTime = time;
      });
    }
  }
}
