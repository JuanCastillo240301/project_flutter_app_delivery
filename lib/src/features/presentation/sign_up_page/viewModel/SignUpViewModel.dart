
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/TextFormFields/CustomTextFormField.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';
import '../../../../Base/Constants/LocalStorageKeys.dart';

import '../Model/SignUpModel.dart';

abstract class SignUpViewModelInput {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController;
  late DateTime selectedDate;
  SignUpModel? signUpModel = SignUpModel();
  Future<Result<bool,Failure>> signUp();
  bool isFormValidate();
}

abstract class SignUpViewModel extends SignUpViewModelInput with TextFormFieldDelegate, BaseViewModel {}

class DefaultSignUpViewModel extends SignUpViewModel {

  // Dependencias
  final SignUpUseCase _signUpUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultSignUpViewModel({  SignUpUseCase? signUpUseCase,
                            SaveLocalStorageUseCase? saveLocalStorageUseCase })
         : _signUpUseCase = signUpUseCase ?? DefaultSignUpUseCase(),
           _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void initState({ required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
    dateController = TextEditingController();
    selectedDate = DateTime.now();
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Future<Result<bool, Failure>> signUp() {
    loadingState.setLoadingState(isLoading: true);

    return _signUpUseCase.execute(params: SignUpUseCaseParameters(username: signUpModel?.username ?? "",
                                                                  email: signUpModel?.email ?? "",
                                                                  password: signUpModel?.password ?? "",
                                                                  phone: signUpModel?.phone ?? "",
                                                                  date: signUpModel?.date))
                         .then( (result) {
              switch (result.status) {
                case ResultStatus.success:
                  _saveLocalStorageUseCase.execute(
                      saveLocalParameteres: SaveLocalStorageParameters(
                          key: LocalStorageKeys.idToken,
                          value: result.value?.localId ?? ""));

                  loadingState.setLoadingState(isLoading: false);
                  return Result.success(true);
                case ResultStatus.error:
                  loadingState.setLoadingState(isLoading: false);
                  return Result.failure(result.error);
              }
    });
  }

  @override
  onChanged({ required String newValue,
              required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        signUpModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        signUpModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
        signUpModel?.username = newValue;
        break;
      case CustomTextFormFieldType.phone:
        signUpModel?.phone = newValue;
        break;
      case CustomTextFormFieldType.dateOfBirth:
        signUpModel?.date = newValue;
        break;
    }
  }
}