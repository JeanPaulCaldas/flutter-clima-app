import 'package:clima/utilities/constants.dart';

import 'location.dart';
import 'networking.dart';

class WeatherModel {
  Future getCityWeather(String cityName) async {
    String url = '$weather_api?q=$cityName&appid=$weather_api_key&units=metric';
    NetworkHelper networkHelper = new NetworkHelper(url);
    return await networkHelper.getData();
  }

  Future getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();
    print('Latitud: ${location.lat} Longitud:${location.lon}');

    NetworkHelper networkHelper = new NetworkHelper(
        '$weather_api?lat=${location.lat}&lon=${location.lon}&appid=$weather_api_key&units=metric');
    return await networkHelper.getData();
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
