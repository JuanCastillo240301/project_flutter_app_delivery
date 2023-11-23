
import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/UserAuthData/UserAuthDataRepository.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Auth/UserAuthData/UserAuthDataEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

import 'UserAuthDataUseCaseBodyParameters.dart';

abstract class UserAuthDataUseCase {
  Future<Result<UserAuthDataEntity, Failure>> execute({ required GetUserDataUseCaseParameters parameters });
}

class DefaultUserAuthDataUseCase extends UserAuthDataUseCase {

  // Dependencias
  final UserAuthDataRepository _userAuthDataRepository;

  DefaultUserAuthDataUseCase({UserAuthDataRepository? userAuthDataRepository })
           : _userAuthDataRepository = userAuthDataRepository ?? DefaultUserAuthDataRepository();

  @override
  Future<Result<UserAuthDataEntity, Failure>> execute({required GetUserDataUseCaseParameters parameters}) {
    return _userAuthDataRepository.getUserAuthData(parameters: GetUserDataBodyParameters(idToken: parameters.idToken)).then( (result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserAuthDataEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
         return Result.failure(result.error);
      }
    });
  }
}