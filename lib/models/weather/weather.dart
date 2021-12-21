import 'package:mooday/services/weather/location.dart';
import 'package:mooday/services/weather/network.dart';


class Weather {
  Future<dynamic> getLocationWeather() {
    LocationService location = LocationService();
    location.getLocation();

    //NetworkService networkService = NetworkService(url)

  }
}
