import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:mooday/screens/timer/localwidgets/circular_timer.dart';
import 'package:circular_menu/circular_menu.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  CountDownController _controller = CountDownController();
  late int duration = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      body: Center(
          child: CircularTimer(
        controller: _controller,
        duration: duration,
      )),
      floatingActionButton: CircularMenu(
        toggleButtonColor: Colors.black,
        items: [
          CircularMenuItem(
              color: Color(0xffbfc0cd),
              iconColor: Colors.black,
              icon: Icons.stop,
              onTap: () {
                setState(() {
                  duration = 0;
                  _controller.pause();
                });
              }),
          CircularMenuItem(
              color: Color(0xffbfc0cd),
              iconColor: Colors.black,
              icon: Icons.play_arrow,
              onTap: () {
                _controller.resume();
              }),
          CircularMenuItem(
              color: Color(0xffbfc0cd),
              iconColor: Colors.black,
              icon: Icons.pause,
              onTap: () {
                _controller.pause();
              }),
          CircularMenuItem(
              color: Color(0xffbfc0cd),
              iconColor: Colors.black,
              icon: Icons.restart_alt,
              onTap: () {
                _controller.restart();
              }),
        ],
      ),
    );
  }
}
