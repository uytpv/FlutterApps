import 'package:geolocator/geolocator.dart';

class Location {
  double long = 0;
  double lat = 0;

  Future<void> getCurrentLocation() async {
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      long = currentPosition.longitude;
      lat = currentPosition.latitude;
    } catch (e) {
      print(e);
    }
  }
}
