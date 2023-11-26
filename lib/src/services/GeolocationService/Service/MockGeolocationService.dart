
import 'package:geolocator/geolocator.dart';
import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';
import '../Interfaces/GeolocationServiceInterfaces.dart';
import '../Mappers/GeolocationServiceMappers.dart';

class MockGeolocationService extends GeolocationService {
  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() async {

    var fakePosition =  Position(longitude: 2.169188,
        latitude: 41.386400,
        timestamp:  DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0, altitudeAccuracy:  0.0, headingAccuracy: 0.0);

    return Result.success(GeolocationServiceMapper.mapPosition(fakePosition));
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    return LocationPermissionStatus.denied;
  }

}