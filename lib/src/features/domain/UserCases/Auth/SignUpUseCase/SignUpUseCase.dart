
import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/SignUpRepository/SignUpRepository.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/SignUpRepository/SignUpRepositoryParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/User/UserEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/Dates/DateHelpers.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/UserPhotos/UserPhotoHelper.dart';

import 'SignUpUseCaseParameters.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Failure>> execute({ required SignUpUseCaseParameters params });
}

class DefaultSignUpUseCase extends SignUpUseCase {

  // Dependencias
  SignUpRepository _signUpRepository;
  SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCase({ SignUpRepository? signUpRepository, SaveUserDataUseCase? saveUserDataUseCase })
             : _signUpRepository = signUpRepository ?? DefaultSignUpRepository(),
               _saveUserDataUseCase = saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUseCaseParameters params }) {
    return _signUpRepository.signUp(params: SignUpRepositoryParameters(email: params.email, password: params.password)).then( (result) {
         switch (result.status) {
           case ResultStatus.success:
             // Null Check
             if (result.value == null) {
               return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
             }
             SignUpEntity entity = SignUpEntity.fromMap(result.value!.toMap());

             return saveUserDataInDataBase( params: params,
                                            entity: entity);
           case ResultStatus.error:
            return Result.failure(result.error);
         }
    });
  }
}

extension on DefaultSignUpUseCase {
  Future<Result<SignUpEntity, Failure>> saveUserDataInDataBase({ required SignUpUseCaseParameters params,
                                                                  required SignUpEntity entity }) {
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
      localId: entity.localId,
      role: UserRole.user,
      username: params.username,
      email: params.email,
      phone: params.phone,
      dateOfBirth: params.date,
      startDate: DateHelpers.getStartDate(),
      photo: UserPhotoHelper.defaultUserPhoto,
      shippingAddress: '',
      billingAddress: '',
      idToken: entity.idToken
    );

    return _saveUserDataUseCase.execute(parameters: _params).then( (result) {
        switch (result.status) {
          case ResultStatus.success:
            return Result.success(entity);
          case ResultStatus.error:
            return Result.failure(result.error);
        }
    });
  }
}