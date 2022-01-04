import 'package:flutter/material.dart';
import 'package:mooday/screens/mood/localwidgets/tracker/end_child.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:mooday/screens/mood/localwidgets/tracker/start_child.dart';

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
                beforeLineStyle: LineStyle(color: Colors.grey),
                indicatorStyle: const IndicatorStyle(
                  indicatorXY: 0.3,
                  drawGap: true,
                  width: 25,
                  height: 30,
                ),
                isFirst: index == 0,
                isLast: index == 4,
                startChild: StartChild(),
                endChild: EndChild());
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
