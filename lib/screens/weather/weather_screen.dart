import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:location/location.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  initState() {
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    var position = await location.getLocation();
    print(position);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}
