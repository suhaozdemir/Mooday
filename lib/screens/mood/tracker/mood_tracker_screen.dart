import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/models/mood/mood.dart';
import 'package:mooday/models/mood/mood_data.dart';
import 'package:mooday/screens/mood/localwidgets/tracker/end_child.dart';
import 'package:mooday/services/firebase/database.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:mooday/screens/mood/localwidgets/tracker/start_child.dart';

class MoodTrackerScreen extends StatelessWidget {
  const MoodTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder(
            stream: DatabaseService().readMoods(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final List<Mood> moods = snapshot.data;
                    if (moods.isEmpty == true) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WHOOPS!',
                            style: STYLE_TITLE,
                          ),
                          Text(
                            'You forgot adding Mood.',
                            style: STYLE_TITLE.copyWith(fontSize: 25),
                          ),
                          Image.asset(
                            'assets/images/empty/empty_time.png',
                          ),
                        ],
                      );
                    }
                    return Consumer<MoodData>(
                        builder: (context, MoodData, child) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              beforeLineStyle:
                                  const LineStyle(color: Colors.grey),
                              indicatorStyle: const IndicatorStyle(
                                indicatorXY: 0.3,
                                drawGap: true,
                                width: 25,
                                height: 30,
                              ),
                              isFirst: index == 0,
                              isLast: index == moods.length - 1,
                              startChild: StartChild(date: moods[index].date),
                              endChild: EndChild(
                                moodName: moods[index].name,
                                moodHour: moods[index].hour,
                                moodIcon: moods[index].icon,
                                longPressCallback: () {
                                  DatabaseService().deleteMood(moods[index]);
                                  DatabaseService().addLog(
                                      'DELETED MOOD: [${moods[index].name}]');
                                },
                              ));
                        },
                        itemCount: moods.length,
                      );
                    });
                  }
              }
            }),
      ),
    );
  }
}
