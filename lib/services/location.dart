import 'package:geolocator/geolocator.dart';

class Location {

  double latitude ;
  double longtude ;

 Future <void> getCurrentLocation() async {
    try {
      Position position = await getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longtude=position.longitude;
    } catch (e) {
      print(e);
    }

  }

}