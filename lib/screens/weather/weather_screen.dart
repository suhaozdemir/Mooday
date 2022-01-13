import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/models/weather/weather.dart';
import 'package:mooday/widgets/floating_button.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.locationWeather});

  final locationWeather;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather weather = Weather();
  late int temperature;
  late Image weatherImage;
  late String cityName;
  late String weatherDesc;
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updateWeather(widget.locationWeather);
  }

  void updateWeather(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherImage = Image.asset('assets/images/moods/sadmood.png');
        weatherDesc = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherImage = weather.getWeatherIcon(condition);
      weatherDesc =
          weatherData['weather'][0]['description'].toString().toUpperCase();
      cityName = weatherData['name'].toString().toUpperCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: TextField(
                      controller: _cityController,
                      decoration: DECORATION_TEXT_FILE.copyWith(
                          hintText: 'Enter a City'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 17.0),
                  child: Material(
                    elevation: 10.0,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(32.0),
                    child: MaterialButton(
                      onPressed: () async {
                        var typedName = await _cityController.text;
                        if (typedName != null) {
                          var weatherData =
                              await weather.getCityWeather(typedName);
                          updateWeather(weatherData);
                        }
                      },
                      minWidth: 10.0,
                      height: 40.0,
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70.0),
            weatherImage,
            const SizedBox(height: 5.0),
            Text(
              '$temperature°C',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
            ),
            const SizedBox(height: 5.0),
            Text(
              cityName,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            const SizedBox(height: 5.0),
            Text(
              weatherDesc,
              style:
                  const TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingButton(
          scale: 1.2,
          title: 'Back',
          onPressed: () {
            Navigator.pushNamed(context, ROUTE_HOME);
          }),
    );
  }
}
