
import 'package:geolocator/geolocator.dart';

class Location{

  late double Latitute ;
  late double Longitute;

  Future<void> getLocation() async {
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      Latitute = position.latitude;
      Longitute = position.longitude;
    }
    catch(e){
      print(e);
    }
}


}