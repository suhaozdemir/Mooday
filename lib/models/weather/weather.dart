import 'package:mooday/services/weather/location.dart';
import 'package:mooday/services/weather/network.dart';
import 'package:mooday/assets/constants.dart';

class Weather {
  Future<dynamic> getLocationWeather() async {
    LocationService location = LocationService();
    await location.getLocation();

    NetworkService networkService = NetworkService(
        '$API_URL?lat=${location.latitude}&appid=$API_KEY&units=metric');

    var weatherData = await networkService.getData();
    return weatherData;
  }
}
