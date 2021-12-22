import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mooday/models/weather/weather.dart';
import 'package:mooday/screens/weather/weather_screen.dart';

class LoadWeatherScreen extends StatefulWidget {
  const LoadWeatherScreen({Key? key}) : super(key: key);

  @override
  _LoadWeatherScreenState createState() => _LoadWeatherScreenState();
}

class _LoadWeatherScreenState extends State<LoadWeatherScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await Weather().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SpinKitPouringHourGlass(
        color: Colors.black,
        size: 100.0,
      ),
    );
  }
}
