



import 'package:project_flutter_app_delivery/src/features/data/Repositories/LocalStorage/RemoveLocalStorageRepository.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';

import 'LocalStorageUseCaseParameters.dart';

abstract class RemoveLocalStorageUseCase {
  Future<void> execute({ required RemoveLocalStorageParameters parameters });
}

class DefaultRemoveLocalStorageUseCase extends RemoveLocalStorageUseCase {

  // Dependencias
  final RemoveLocalStorageRepository _removeLocalStorageRepository;

  DefaultRemoveLocalStorageUseCase({ RemoveLocalStorageRepository? removeLocalStorageRepository })
     : _removeLocalStorageRepository = removeLocalStorageRepository ?? DefaultRemoveLocalStorageRepository();

  @override
  Future<void> execute({required RemoveLocalStorageParameters parameters}) async {
    return await _removeLocalStorageRepository.removeInLocalStorage(key: parameters.key);
  }
}