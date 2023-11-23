

import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/users/FetchUserDataRepository.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/User/UserEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

abstract class FetchUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute({ required String localId });
}

class DefaultFetchUserDataUseCase extends FetchUserDataUseCase {
  // Dependencias
  final FetchUserDataRepository _fetchUserDataRepository;

  DefaultFetchUserDataUseCase({ FetchUserDataRepository? fetchUserDataRepository })
      : _fetchUserDataRepository = fetchUserDataRepository ?? DefaultFetchUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({ required String localId}) {
    return _fetchUserDataRepository.fetchUserData(localId: localId)
                                   .then( (result) {
      switch (result.status) {
        case ResultStatus.success:
          if( result.value == null) {
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}