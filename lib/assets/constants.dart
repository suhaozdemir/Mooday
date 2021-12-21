import 'package:flutter/material.dart';

// ROUTING
const String ROUTE_LANDING = '/';
const String ROUTE_LANDING_AFTER = '/lafter';
const String ROUTE_REGISTER = '/register';
const String ROUTE_LOGIN = '/login';
const String ROUTE_HOME = '/home';
const String ROUTE_MOOD = '/mood';
const String ROUTE_TIMER = '/timer';
const String ROUTE_TODO = '/todo';
const String ROUTE_WEATHER = '/weather';

// API
const String API_URL = 'https://api.openweathermap.org/data/2.5/weather';
const String API_KEY = '6d3d1a05c0a9edde18dda340a0842d6a';

// TEXT AND STYLES
const String TEXT_TITLE = '/mooday;';
const STYLE_TITLE = TextStyle(
    fontSize: 30.0,
    fontFamily: 'Oswald',
    color: Colors.black,
    fontWeight: FontWeight.bold);

const String TEXT_SUBTITLE = 'Track your day.';
const STYLE_SUBTITLE = TextStyle(
    fontSize: 45.0, fontWeight: FontWeight.w800, fontFamily: 'Oswald');

const String TEXT_SUBTITLE_2 = 'Click start to begin.';
const STYLE_SUBTITLE_2 = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);

const DECORATION_TEXT_FILE = InputDecoration(
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

// SNACKBAR MESSAGES
const SNACKBAR_SUCCESS = SnackBar(content: Text('Login Successfull!'));
const SNACKBAR_ERROR = SnackBar(content: Text('Wrong email or password!'));

// THEME COLORS
const THEME_COLOR_2 = Color(0XFFF2F1F6);
