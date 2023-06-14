import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = '3d944779bf4d4380a60113455231206';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Location location = new Location();
    var uri = Uri.https('api.weatherapi.com', '/v1/current.json',
        {'key': '$apiKey', 'q': '$cityName'});
    NetworkHelper networkHelper = new NetworkHelper(uri);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    var uri = Uri.https('api.weatherapi.com', '/v1/current.json',
        {'key': '$apiKey', 'q': '${location.lat},${location.long}'});
    NetworkHelper networkHelper = new NetworkHelper(uri);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
