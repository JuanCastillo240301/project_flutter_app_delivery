
import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/features/data/Decodables/Decodables/User/UserDecodable.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Interfaces/interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDataBaseService.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

extension Paths on DefaultFetchUserDataRepository {
  static String path = "users/";
}

class DefaultFetchUserDataRepository extends FetchUserDataRepository {

  // Dependencias
  final RealtimeDatabaseService _realtimeDatabaseService;

  DefaultFetchUserDataRepository({ RealtimeDatabaseService? realtimeDatabaseService })
              : _realtimeDatabaseService = realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> fetchUserData({required String localId}) async {
    var fullpath = path + localId;

    try {
      final result = await _realtimeDatabaseService.getData(path: fullpath);
      UserDecodable _decodable = UserDecodable.fromMap(result);
      return Result.success(_decodable);
    } on Failure catch(f) {
       return Result.failure(f);
    }
  }
}