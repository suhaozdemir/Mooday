import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(ktitleText),
        titleTextStyle: ktitleStyle,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
    );
  }
}
