import '../Interfaces/GeolocationServiceInterfaces.dart';
import 'package:geolocator/geolocator.dart';

class DefaultGeolocationServiceHelper extends GeolocationServiceHelper {
  @override
  double getDistanceBetweenInKilometters(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude) {
    return Geolocator.distanceBetween(startLatitude, startLongitude, destinationLatitude, destinationLongitude) / 1000;
  }

  @override
  double getDistanceBetweenInMetters(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude)  {
    return Geolocator.distanceBetween(startLatitude, startLongitude, destinationLatitude, destinationLongitude);
  }
}