import 'package:geolocator/geolocator.dart';

class Location{

  double ? latitude;
  double ? longitude;

  Future<void> getCurrentLocation()async{
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.low,
    );

    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);

      latitude = position.latitude;
      longitude = position.longitude;

    } catch (e){
      print('something went wrong');
    }
  }
}