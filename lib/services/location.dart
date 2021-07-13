import 'package:geolocator/geolocator.dart';

class Location {
  double _lat;
  double _lon;

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      _lat = position.latitude;
      _lon = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  double get lon => _lon;

  double get lat => _lat;
}
