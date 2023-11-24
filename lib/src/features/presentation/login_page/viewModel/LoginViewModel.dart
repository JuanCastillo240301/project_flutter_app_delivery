
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Base/Constants/LocalStorageKeys.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/SignInUseCase/SignInUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/SignInUseCase/SignInUseCaseBodyParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/TextFormFields/CustomTextFormField.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/login_page/model/LoginModel.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

abstract class LoginViewModelInput {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel? loginModel = LoginModel(email: '', password: '');
  Future<Result<bool, Failure>> login({ required String email,
                                        required String password });
  bool isFormValidate();
}

abstract class LoginViewModel extends LoginViewModelInput with TextFormFieldDelegate, BaseViewModel {}

class DefaultLoginViewModel extends LoginViewModel {

  // * Dependencies
  // * UseCases
  final SignInUseCase _signInUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  // * Constructor
  DefaultLoginViewModel({ SignInUseCase? signInUseCase,
                          SaveLocalStorageUseCase? saveLocalStorageUseCase })
      : _signInUseCase = signInUseCase ?? DefaultSignInUseCase(),
        _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void initState({ required LoadingStateProvider loadingStateProvider }) {
    loadingState = loadingStateProvider;
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Future<Result<bool, Failure>> login({ required String email,
                                        required String password }) {
    loadingState.setLoadingState(isLoading: true);

    return _signInUseCase.execute(params: SignInUseCaseBodyParameters(email: email,
                                                                      password: password)).then( (result) {
             switch (result.status) {
               case ResultStatus.success:
                 loadingState.setLoadingState(isLoading: false);
                 _saveLocalStorageUseCase.execute(parameters: SaveLocalStorageParameters( key: LocalStorageKeys.idToken,
                                                                                          value: result.value?.idToken ?? ""));

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
        loginModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        loginModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
       // TODO: Handle this case.
        break;
      case CustomTextFormFieldType.phone:
      // TODO: Handle this case.
        break;
      case CustomTextFormFieldType.dateOfBirth:
      // TODO: Handle this case.
        break;
    }
  }
}