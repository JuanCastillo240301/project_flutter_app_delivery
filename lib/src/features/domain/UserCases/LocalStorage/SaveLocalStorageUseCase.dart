
import 'package:project_flutter_app_delivery/src/features/data/Repositories/LocalStorage/SaveLocalStorageRepository.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';

import 'LocalStorageUseCaseParameters.dart';

abstract class SaveLocalStorageUseCase {
  Future<void> execute({ required SaveLocalStorageParameters parameters });
}

class DefaultSaveLocalStorageUseCase extends SaveLocalStorageUseCase {

  // Dependencias
  final SaveLocalStorageRepository _saveLocalStorageRepository;

  DefaultSaveLocalStorageUseCase({ SaveLocalStorageRepository? saveLocalStorageRepository })
  : _saveLocalStorageRepository = saveLocalStorageRepository ?? DefaultSaveLocalStorageRepository();

  @override
  Future<void> execute({required SaveLocalStorageParameters parameters}) async {
    _saveLocalStorageRepository.saveInLocalStorage(key: parameters.key, value: parameters.value);
  }
}