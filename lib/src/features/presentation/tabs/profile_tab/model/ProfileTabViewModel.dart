



import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/SignOutUseCase/SignOutUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';

abstract class ProfileTabViewModelInput {
  late LoadingStateProvider loadingStatusState;

  Future<void> signOut();
  void initState({ required LoadingStateProvider loadingState });
}

abstract class ProfileTabViewModel extends ProfileTabViewModelInput {}

class DefaultProfileTabViewModel extends ProfileTabViewModel {

  // Dependencias
  final SignOutUseCase _signOutUseCase;

  DefaultProfileTabViewModel({ SignOutUseCase? signOutUseCase })
         : _signOutUseCase = signOutUseCase ?? DefaultSignOutUseCase();

  @override
  void initState({ required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<void> signOut() {
    loadingStatusState.setLoadingState(isLoading: true);
    return _signOutUseCase.execute().then( (_) => loadingStatusState.setLoadingState(isLoading: false));
  }
}