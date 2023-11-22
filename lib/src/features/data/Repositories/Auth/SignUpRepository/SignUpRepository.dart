
import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/SignUpRepository/SignUpRepositoryParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Decodables/SignUpDecodable.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/services/SignUpAuthService.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

class DefaultSignUpRepository extends SignUpRepository {

  // Dependencias
  SignUpService _signUpService;

  DefaultSignUpRepository({ SignUpService? signUpService })
             : _signUpService = signUpService ?? DefaultSignUpService();

  @override
  Future<Result<SignUpDecodable, Failure>> signUp({required SignUpRepositoryParameters params}) async {
    try {
      final result = await _signUpService.signUp(bodyParameters: params.toMap());
      SignUpDecodable decodable = SignUpDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch(f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }

}