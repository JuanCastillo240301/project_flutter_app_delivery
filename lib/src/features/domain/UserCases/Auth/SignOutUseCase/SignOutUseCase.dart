


import 'package:project_flutter_app_delivery/src/Base/Constants/LocalStorageKeys.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/RemoveLocalStorageUseCase.dart';

abstract class SignOutUseCase {
  Future<void> execute();
}

class DefaultSignOutUseCase extends SignOutUseCase {

  // Dependencias
  final RemoveLocalStorageUseCase _removeLocalStorageUseCase;

  DefaultSignOutUseCase({ RemoveLocalStorageUseCase? removeLocalStorageUseCase })
      : _removeLocalStorageUseCase = removeLocalStorageUseCase ?? DefaultRemoveLocalStorageUseCase();

  @override
  Future<void> execute() async {
    return _removeLocalStorageUseCase.execute(parameters: RemoveLocalStorageParameters(key: LocalStorageKeys.idToken));
  }
}