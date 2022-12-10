import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 30.6;
  double longitude = 17;

  Future<void> getCurrentLoccation() async {
    try {
      var permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
