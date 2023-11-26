

import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/User/UserEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/GoogleSignInUseCase/GoogleSignInUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

abstract class WelcomePageViewModelInput {
  Future<Result<UserEntity,Failure>> signInWithGoogle();
}

abstract class WelcomePageViewModel extends WelcomePageViewModelInput with BaseViewModel {}

class DefaultWelcomePageViewModel extends WelcomePageViewModel {

  // Dependencias
  final GoogleSignInUseCase _googleSignInUseCase;

  DefaultWelcomePageViewModel({
    GoogleSignInUseCase? googleSignInUseCase
  }) : _googleSignInUseCase = googleSignInUseCase ?? DefaultGoogleSignInUseCase();

  @override
  Future<Result<UserEntity,Failure>> signInWithGoogle() {
    return _googleSignInUseCase.execute();
  }

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
  }
}