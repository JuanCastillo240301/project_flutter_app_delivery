
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Interfaces/interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDataBaseService.dart';

class DefaultPlaceDetailRepository extends PlaceDetailRepository {

  String _path = "placeList/";

  // * Dependencies
  final RealtimeDatabaseService _realtimeDataBaseService;

  DefaultPlaceDetailRepository({ RealtimeDatabaseService? realtimeDataBaseService })
      : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<void> savePlaceDetail({ required PlaceListDetailEntity placeDetail }) {
    var fullPath = _path + placeDetail.placeId;
    return _realtimeDataBaseService.putData(bodyParamaters: placeDetail.toMap(), path: fullPath);
  }
}