

import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Decodables/UpdatePasswordDecodable.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/services/UpdatePasswordUserService.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

class DefaultUpdatePasswordRepository extends UpdatePasswordRepository {

  // Dependencias
  final UpdatePasswordUserService _updatePasswordUserService;

  DefaultUpdatePasswordRepository({ UpdatePasswordUserService? updatePasswordUserService })
           : _updatePasswordUserService = updatePasswordUserService ?? DefaultUpdatePasswordUserService();

  @override
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({required String email}) async {
    try {
      final result = await _updatePasswordUserService.updatePassword(email: email);
      UpdatePasswordDecodable _decodable = UpdatePasswordDecodable.fromMap(result);
      return Result.success(_decodable);
    } on Failure catch(f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}