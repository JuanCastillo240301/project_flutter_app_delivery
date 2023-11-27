
import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/features/data/Decodables/Decodables/User/UserDecodable.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Interfaces/interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDataBaseService.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

class DefaultFetchUserDataRepository extends FetchUserDataRepository {
  final String _path = "users/";

  // * Dependencies
  final RealtimeDatabaseService _realtimeDataBaseService;

  DefaultFetchUserDataRepository({ RealtimeDatabaseService? realtimeDataBaseService }) : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> fetchUserData({ required String localId }) async {
    var fullpath = _path + localId;
    try {
      final result = await _realtimeDataBaseService.getData(path: fullpath);
      return Result.success(UserDecodable.fromMap(result));
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
