import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:mooday/models/mood/mood.dart';
import 'package:mooday/models/mood/mood_data.dart';
import 'package:mooday/screens/mood/localwidgets/mood_icons.dart';
import 'package:mooday/screens/mood/localwidgets/datetime_picker.dart';
import 'package:mooday/services/firebase/database.dart';
import 'package:mooday/widgets/floating_button.dart';
import 'package:mooday/assets/constants.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
            const Text('How are you?', style: STYLE_TITLE),
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
                  onTap: () {
                    addMood('Happy', 'assets/images/moods/mood.png');
                  },
                ),
                MoodIcons(
                    title: 'Good',
                    moodImg: 'assets/images/moods/goodmood.png',
                    onTap: () {
                      addMood('Good', 'assets/images/moods/goodmood.png');
                    }),
                MoodIcons(
                    title: 'Neutral',
                    moodImg: 'assets/images/moods/neutralmood.png',
                    onTap: () {
                      addMood('Neutral', 'assets/images/moods/neutralmood.png');
                    }),
                MoodIcons(
                    title: 'Sad',
                    moodImg: 'assets/images/moods/sadmood.png',
                    onTap: () {
                      addMood('Sad', 'assets/images/moods/sadmood.png');
                    }),
                MoodIcons(
                    title: 'Bad',
                    moodImg: 'assets/images/moods/crymood.png',
                    onTap: () {
                      addMood('Bad', 'assets/images/moods/crymood.png');
                    }),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: CircularMenu(
        alignment: Alignment.bottomRight,
        toggleButtonColor: Colors.black,
        items: [
          CircularMenuItem(
              color: Colors.white,
              iconColor: Colors.black,
              icon: Icons.arrow_back,
              onTap: () {
                Navigator.pop(context);
              }),
          CircularMenuItem(
              color: Colors.white,
              iconColor: Colors.black,
              icon: Icons.timeline,
              onTap: () {
                Navigator.pushNamed(context, ROUTE_MOOD_TRACKER);
              })
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
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: pickedTime,
    );

    if (time != null) {
      setState(() {
        pickedTime = time;
      });
    }
  }

  void addMood(String title, String icon) {
    final mood = Mood(
        name: title,
        icon: icon,
        date: DateFormat.yMMMd().format(pickedDate),
        hour: pickedTime.format(context),
        id: DateTime.now().toString(),
        fulltime: DateFormat("yyyy-MM-dd").format(pickedDate) +
            " | " +
            ('${pickedTime} | ${DateTime.now()}'));
    Provider.of<MoodData>(context, listen: false).addMood(mood);
    DatabaseService().addLog('ADDED MOOD: [${title}]');
  }
}
