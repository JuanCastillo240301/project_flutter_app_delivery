

import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/features/data/Decodables/Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/services/GetUserAuthDataService.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

class DefaultUserAuthDataRepository extends UserAuthDataRepository {

  // Dependencias
  final GetUserAuthDataService _getUserAuthDataService;

  DefaultUserAuthDataRepository({ GetUserAuthDataService? getUserAuthDataService })
           : _getUserAuthDataService = getUserAuthDataService ?? DefaultGetUserAuthDataService();

  @override
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData({required GetUserDataBodyParameters parameters}) async {
    try {
      final result = await _getUserAuthDataService.getUserAuthData(bodyparameters: parameters.toMap());
      UserAuthDataDecodable _decodable = UserAuthDataDecodable.fromMap(result);
      return Result.success(_decodable);
    } on Failure catch(f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}