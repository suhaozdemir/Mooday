import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class CircularTimer extends StatelessWidget {
  CircularTimer({required this.controller, required this.duration});
  final CountDownController controller;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularCountDownTimer(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        duration: duration,
        fillColor: const Color(0xffBFC0CD),
        ringColor: Colors.white,
        controller: controller,
        backgroundColor: Colors.white54,
        strokeWidth: 50.0,
        strokeCap: StrokeCap.round,
        autoStart: false,
        isTimerTextShown: true,
        isReverse: false,
        onComplete: () {
          print('a');
        },
        textStyle: TextStyle(fontSize: 50.0, color: Colors.black),
      ),
    );
  }
}
