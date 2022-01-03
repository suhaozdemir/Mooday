import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:mooday/screens/notes/localwidgets/note_card.dart';

class MoodTrackerScreen extends StatelessWidget {
  const MoodTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.3,
                beforeLineStyle: LineStyle(color: Colors.black),
                indicatorStyle: const IndicatorStyle(
                  indicatorXY: 0.3,
                  drawGap: true,
                  width: 30,
                  height: 30,
                ),
                isFirst: index == 0,
                isLast: index == 4,
                startChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('DD/MM/YY'),
                ),
                endChild: NoteCard(
                    noteTitle: 'MOOD_NAME',
                    noteDesc: 'MOOD_NAME',
                    onPressed: () {}));
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
