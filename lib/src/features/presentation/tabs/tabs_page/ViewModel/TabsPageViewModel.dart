
import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Geolocation/GeolocationUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:project_flutter_app_delivery/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';

abstract class TabsPageViewModelInput {
  Future<Result<bool,Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}

abstract class TabsPageViewModel extends TabsPageViewModelInput with BaseViewModel {}

class DefaultTabsPageViewModel extends TabsPageViewModel {

  // Dependencias
  final GeolocationUseCase _geolocationUseCase;

  DefaultTabsPageViewModel({
    GeolocationUseCase? geolocationUseCase
  }) : _geolocationUseCase = geolocationUseCase ?? DefaultGeolocationUseCase();

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
  }

  @override
  Future<Result<bool, Failure>> getCurrentPosition() async {
   return await _geolocationUseCase.getCurrentPosition().then( (result) {
     switch (result.status) {
       case ResultStatus.success:
         return Result.success(true);
       case ResultStatus.error:
         return Result.failure(result.error);
     }
   });
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() {
    return _geolocationUseCase.getPermissionStatus();
  }
}

