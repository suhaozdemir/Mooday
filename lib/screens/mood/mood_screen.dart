import 'package:flutter/material.dart';
import 'package:mooday/screens/mood/localwidgets/mood_icons.dart';
import 'package:mooday/screens/mood/localwidgets/datetime_picker.dart';
import 'package:mooday/widgets/floating_button.dart';
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
            const Text('How are you?', style: ktitleStyle),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DateTimePicker(
                  icon: Icons.date_range_rounded,
                  pickedDate: pickedDate,
                  onPressed: _pickDate,
                  time:
                      '${pickedDate.day} / ${pickedDate.month} / ${pickedDate.year}',
                ),
                const SizedBox(width: 10.0),
                DateTimePicker(
                  pickedDate: pickedDate,
                  icon: Icons.watch_later_outlined,
                  onPressed: _pickTime,
                  time: '${pickedTime.hour} : ${pickedTime.minute}',
                ),
              ],
            ),
            const SizedBox(height: 30.0),
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
      floatingActionButton: FloatingButton(
        scale: 1.2,
        title: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
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
