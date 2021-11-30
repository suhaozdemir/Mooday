import 'package:flutter/material.dart';

//Routing
const String landingRoute = '/';
const String landingAfterRoute = '/lafter';
const String registerRoute = '/register';
const String loginRoute = '/login';
const String homeRoute = '/home';
const String moodRoute = '/mood';
const String timerRoute = '/timer';

const String ktitleText = '/mooday;';
const ktitleStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: 'Oswald',
    color: Colors.black,
    fontWeight: FontWeight.bold);

const String ksubtitleText = 'Track your day.';
const ksubtitleStyle = TextStyle(
    fontSize: 45.0, fontWeight: FontWeight.w800, fontFamily: 'Oswald');

const String ksubtitleText2 = 'Click start to begin.';
const ksubtitleStyle2 = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);

const kTextFileDecoration = InputDecoration(
  hintText: 'Enter your email',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const ksnackSuccess = SnackBar(content: Text('Login Successfull!'));
const ksnackError = SnackBar(content: Text('Wrong email or password!'));
