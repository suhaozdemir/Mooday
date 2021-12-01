import 'package:flutter/material.dart';
import 'package:mooday/screens/mood/localwidgets/mood_icons.dart';
import 'package:mooday/assets/constants.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'How are you?',
              style: ktitleStyle,
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  icon: Icon(Icons.date_range_rounded),
                  label: Text(
                      '${pickedDate.day} / ${pickedDate.month} / ${pickedDate.year}'),
                  onPressed: _pickDate,
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(50.0, 50.0),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.watch_later_outlined),
                  label: Text('${pickedTime.hour} : ${pickedTime.minute}'),
                  onPressed: _pickTime,
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(50.0, 50.0),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Wrap(
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
          ],
        ),
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
