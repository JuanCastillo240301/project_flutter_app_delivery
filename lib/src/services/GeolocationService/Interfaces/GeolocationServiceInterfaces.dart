

import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

abstract class GeolocationService {
  Future<Result<PositionEntity,Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();

}

abstract class GeolocationServiceHelper {
  double getDistanceBetweenInMetters(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude);
  double getDistanceBetweenInKilometters(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude);
}