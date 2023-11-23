

import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/UpdatePassword/UpdatePasswordRepository.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';

abstract class UpdatePasswordUseCase {
  Future<void> execute({ required String email});
}

class DefaultUpdatePasswordUseCase extends UpdatePasswordUseCase {

  // Dependencias
  UpdatePasswordRepository _updatePasswordRepository;

  DefaultUpdatePasswordUseCase({ UpdatePasswordRepository? updatePasswordRepository })
          : _updatePasswordRepository = updatePasswordRepository ?? DefaultUpdatePasswordRepository();

  @override
  Future<void> execute({ required String email }) {
    return _updatePasswordRepository.updatePassword(email: email);
  }
}