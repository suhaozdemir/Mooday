import 'package:flutter/widgets.dart';
import 'package:mooday/services/weather/location.dart';
import 'package:mooday/services/network.dart';
import 'package:mooday/assets/constants.dart';

class Weather {
  Future<dynamic> getLocationWeather() async {
    LocationService location = LocationService();
    await location.getLocation();

    NetworkService networkService = NetworkService(
        '$WEATHER_API_URL?lat=${location.latitude}&lon=${location.longitude}&appid=$WEATHER_API_KEY&units=metric');

    var weatherData = await networkService.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) {
    var url =
        '$WEATHER_API_URL?q=$cityName&appid=$WEATHER_API_KEY&units=metric';

    NetworkService networkService = NetworkService(url);

    var weatherData = networkService.getData();
    return weatherData;
  }

  Image getWeatherIcon(int condition) {
    if (condition <= 202) {
      return Image.asset('assets/images/weather/weather-rainstorm.gif');
    } else if (condition <= 232) {
      return Image.asset('assets/images/weather/weather-thunder.gif');
    } else if (condition <= 321) {
      return Image.asset('assets/images/weather/weather_lrainy.gif');
    } else if (condition <= 531) {
      return Image.asset('assets/images/weather/weather_rainy.gif');
    } else if (condition <= 622) {
      return Image.asset('assets/images/weather/weather_snowy.gif');
    } else if (condition <= 781) {
      return Image.asset('assets/images/weather/weather_haze.gif');
    } else if (condition == 800) {
      return Image.asset('assets/images/weather/weather_clear.gif');
    } else if (condition <= 804) {
      return Image.asset('assets/images/weather/weather_cloudy.gif');
    } else {
      return Image.asset('assets/images/moods/sadmood.png');
    }
  }
}
