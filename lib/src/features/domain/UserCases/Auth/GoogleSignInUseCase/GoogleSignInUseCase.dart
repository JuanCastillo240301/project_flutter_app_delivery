import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Base/Constants/LocalStorageKeys.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/User/UserEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:project_flutter_app_delivery/src/services/GoogleSignIn/Entities/GoogleUserEntity.dart';
import 'package:project_flutter_app_delivery/src/services/GoogleSignIn/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/GoogleSignIn/Service/GoogleSignInService.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/Dates/DateHelpers.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

class GlobalUserData {
  static String? photoURL;
  static String? name;
  static String? idTok;
  static bool? emailandpass = false;
}

abstract class GoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> execute();
}

class DefaultGoogleSignInUseCase extends GoogleSignInUseCase {
  // Dependencies
  final GoogleSignInService _googleSignInService;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultGoogleSignInUseCase(
      {GoogleSignInService? googleSignInService,
      SaveLocalStorageUseCase? saveLocalStorageUseCase,
      SaveUserDataUseCase? saveUserDataUseCase})
      : _googleSignInService =
            googleSignInService ?? DefaultGoogleSignInService(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase(),
        _saveUserDataUseCase =
            saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<UserEntity, Failure>> execute() async {
    final user = await _googleSignInService.signInWithGoogle();
    _saveLocalStorageUseCase.execute(
        saveLocalParameteres: SaveLocalStorageParameters(
            key: LocalStorageKeys.idToken, value: user.idToken ?? "123213"));
    final isUserInDatabase =
        await _googleSignInService.isUserInDatabase(uid: user.uid ?? "123123");
    if (isUserInDatabase) {
      print(user.photoURL);
      GlobalUserData.photoURL = user.photoURL;
      GlobalUserData.name = user.displayName;
      GlobalUserData.idTok = null;
      GlobalUserData.emailandpass = false;
      return Result.success(mapUserEntity(user: user));
    } else {
      GlobalUserData.photoURL = user.photoURL;
      GlobalUserData.name = user.displayName;
      GlobalUserData.idTok = null;
      print(_saveUserDataInDataBase);
      return _saveUserDataInDataBase(user: user);
    }
  }
}

extension on DefaultGoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> _saveUserDataInDataBase(
      {required GoogleSignInUserEntity user}) {
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
        localId: user.uid,
        role: UserRole.user,
        username: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
        dateOfBirth: "",
        startDate: DateHelpers.getStartDate(),
        photo: user.photoURL,
        shippingAddress: '',
        billingAddress: '',
        idToken: user.idToken);

    return _saveUserDataUseCase.execute(parameters: _params);
  }

  UserEntity mapUserEntity({required GoogleSignInUserEntity user}) {
    return UserEntity(
        localId: user.uid,
        role: UserRole.user.toShortString(),
        username: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
        dateOfBirth: "",
        startDate: DateHelpers.getStartDate(),
        photo: user.photoURL,
        shippingAddress: '',
        billingAddress: '',
        idToken: user.refreshToken);
  }
}
