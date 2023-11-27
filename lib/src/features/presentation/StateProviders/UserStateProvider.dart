
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Places/PlaceList/PlaceDetail/PlaceDetailRepository.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/User/UserEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Places/PlaceListUseCase/FavouritesPlacesUseCase/FavouritesPlacesUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/User/FetchUserDataUseCase/FetchUserDataUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/MainCoordinator/MainCoordinator.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Cards/FavouritesCards/View/FavouritesCardView.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';
import 'package:provider/provider.dart';
abstract class FavouritePageChangeStateDelegate {
  placeFromFavouritesRemoved();
}

class DefaultUserStateProvider extends ChangeNotifier with FavouritesCardViewDelegate {

  UserEntity? userData;

  // Dependencies
  final FetchUserDataUseCase _fetchUserDataUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;
  final FavouritesPlacesUseCase _favouritesPlacesUseCase;

  // Delegates
  FavouritePageChangeStateDelegate? favouritePageChangeStateDelegate;

  DefaultUserStateProvider({ FetchUserDataUseCase? fetchUserDataUseCase,
                             FavouritesPlacesUseCase? favouritesPlacesUseCase,
                             SaveUserDataUseCase? saveUserDataUseCase })
   :    _fetchUserDataUseCase = fetchUserDataUseCase ?? DefaultFetchUserDataUseCase(),
        _saveUserDataUseCase = saveUserDataUseCase ?? DefaultSaveUserDataUseCase(),
        _favouritesPlacesUseCase = favouritesPlacesUseCase ?? DefaultFavouritesPlacesUseCase();

  fetchUserData({ required String localId }) async {
    userData = await _fetchUserDataUseCase.execute(localId: localId);
  }
  
  Future<UserEntity> updateUserData({ required UserEntity user }) async {
     return _saveUserDataUseCase.execute(parameters: SaveUserDataUseCaseParameters.fromUserEntity(user)).then( (result) {
       switch (result.status) {
         case ResultStatus.success:
           if(result.value == null) {
             return Future.error(AppFailureMessages.unExpectedErrorMessage);
           }
           return result.value!;
         case ResultStatus.error:
           return Future.error(AppFailureMessages.unExpectedErrorMessage);
       }
     });
  }

  Future<List<PlaceListDetailEntity>> fetchUserFavouritePlaces() async {
    var placeList = await _favouritesPlacesUseCase.fetchFavouritesPlaces(localId: userData?.localId ?? "");
    return placeList.placeList ?? [];
  }

  @override
  favouriteIconTapped(bool isTapped,
                      String placeId) async {
    await _favouritesPlacesUseCase.saveOrRemoveUserFromPlaceFavourites(placeId: placeId,
                                                                       localId: MainCoordinator.sharedInstance?.userUid ?? "",
                                                                       isFavourite: isTapped);
    if (!isTapped) {
      favouritePageChangeStateDelegate?.placeFromFavouritesRemoved();
    }
  }
}

extension DefaultUserStateProviderExtension on BuildContext {
  DefaultUserStateProvider getDefaultUserStateProvider() => Provider.of<DefaultUserStateProvider>(this);
  UserEntity? getUserData() => Provider.of<DefaultUserStateProvider>(this).userData;
  Future<UserEntity> updateUserData({ required UserEntity user }) => Provider.of<DefaultUserStateProvider>(this).updateUserData(user: user);
}