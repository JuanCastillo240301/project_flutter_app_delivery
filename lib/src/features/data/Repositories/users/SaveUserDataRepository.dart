

import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:project_flutter_app_delivery/src/features/data/Decodables/Decodables/User/UserDecodable.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/users/UserBodyParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Interfaces/interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDataBaseService.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

abstract class _Paths {
  static String userCollection = "users/";
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository {
  // Dependencias
  RealtimeDatabaseService _realtimeDatabaseService;

  DefaultSaveUserDataRepository({RealtimeDatabaseService? realtimeDatabaseService})
                                : _realtimeDatabaseService = realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> saveUserData({required UserBodyParameters parameters}) async {
     if(parameters.localId == null) {
       return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
     }
     // Creamos el path
     var path = _Paths.userCollection + parameters.localId!;

    try {
      final result = await _realtimeDatabaseService.putData(bodyParamaters: parameters.toMap(), path: path);
      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch(f) {
      return Result.failure(f);
    }
  }
}