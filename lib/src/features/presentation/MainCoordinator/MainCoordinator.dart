


import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Constants/LocalStorageKeys.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/FetchLocalStorageUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/User/ValidateCurrentUserUseCase/ValidateCurrentUserUseCase.dart';

class RoutesPath {
  static String welcomePath = "OnboardPage";
  static String tabsPath = "tabs";
}

class MainCoordinator {

  // Dependencies
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserUseCase _validateCurrentUserCase;

  String? userUid;

  MainCoordinator({ FetchLocalStorageUseCase? fetchLocalStorageUseCase,
                    ValidateCurrentUserUseCase? validateCurrentUserCase })
      : _fetchLocalStorageUseCase = fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _validateCurrentUserCase = validateCurrentUserCase ?? DefaultValidateCurrentUserUseCase();


  Future<String?> start() {
    return _isUserLogged().then( (value) {
       return value == null ? RoutesPath.welcomePath : RoutesPath.tabsPath;
    });
  }

  Future<String?> _isUserLogged() async {
    var idToken = await _fetchLocalStorageUseCase.execute(parameters: FetchLocalStorageParameters(key: LocalStorageKeys.idToken));
userUid = idToken;
    return idToken;
  }

    showWelcomePage({ required BuildContext context }) {
    Navigator.pushNamed(context, RoutesPath.welcomePath);
  }

    showTabsPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPath.tabsPath);
  }
}