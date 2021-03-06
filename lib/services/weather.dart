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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
