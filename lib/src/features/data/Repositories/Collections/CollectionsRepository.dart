

import 'package:project_flutter_app_delivery/src/features/data/Decodables/Decodables/Collections/CollectionsDecodable.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Interfaces/interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDataBaseService.dart';

class DefaultCollectionsRepository extends CollectionsRepository {

  String _path = "collections/";

  // * Dependencies
  final RealtimeDatabaseService _realtimeDataBaseService;
  
  DefaultCollectionsRepository({ RealtimeDatabaseService? realtimeDataBaseService })
          : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<CollectionsDecodable> fetchCollections() async {
    final response = await _realtimeDataBaseService.getData(path: _path);
    CollectionsDecodable decodable = CollectionsDecodable.fromMap(response);
    return decodable;
  }
}
