


import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/users/SaveUserDataRepository.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/users/UserBodyParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/User/UserEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute({ required SaveUserDataUseCaseParameters parameters});
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {

  // Dependencias
  final SaveUserDataRepository _saveUserDataRepository;

  DefaultSaveUserDataUseCase({ SaveUserDataRepository? saveUserDataRepository })
      : _saveUserDataRepository = saveUserDataRepository ?? DefaultSaveUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({ required SaveUserDataUseCaseParameters parameters }) {

    UserBodyParameters _parameters = UserBodyParameters(
        localId: parameters.localId,
        role: parameters.role?.toShortString(),
        username: parameters.username,
        email: parameters.email,
        phone: parameters.phone,
        dateOfBirth: parameters.dateOfBirth,
        startDate: parameters.startDate,
        photo: parameters.photo,
        shippingAddress: parameters.shippingAddress,
        billingAddress: parameters.billingAddress,
        idToken: parameters.idToken
    );

    return _saveUserDataRepository.saveUserData(parameters: _parameters).then( (result) {
        switch (result.status) {
            case ResultStatus.success:
              if (result.value == null) {
                return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
              }
              var _entity = UserEntity.fromMap(result.value!.toMap());
              return Result.success(_entity);
            case ResultStatus.error:
              return Result.failure(result.error);
        }
    });
  }
}