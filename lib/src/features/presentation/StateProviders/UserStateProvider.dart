
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Places/PlaceList/PlaceDetail/PlaceDetailRepository.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/User/UserEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Places/PlaceListUseCase/FavouritesPlacesUseCase/FavouritesPlacesUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/User/FetchUserDataUseCase/FetchUserDataUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/MainCoordinator/MainCoordinator.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/Cards/FavouritesCards/View/FavouritesCardView.dart';

abstract class FavouritePageChangeStateDelegate {
  placeFromFavouritesRemoved();
}

class DefaultUserStateProvider extends ChangeNotifier with FavouritesCardViewDelegate {

  UserEntity? userData;

  // Dependencies
  final FetchUserDataUseCase _fetchUserDataUseCase;
  final FavouritesPlacesUseCase _favouritesPlacesUseCase;

  // Delegates
  FavouritePageChangeStateDelegate? favouritePageChangeStateDelegate;

  DefaultUserStateProvider({ FetchUserDataUseCase? fetchUserDataUseCase,
                             FavouritesPlacesUseCase? favouritesPlacesUseCase })
   :    _fetchUserDataUseCase = fetchUserDataUseCase ?? DefaultFetchUserDataUseCase(),
        _favouritesPlacesUseCase = favouritesPlacesUseCase ?? DefaultFavouritesPlacesUseCase();

  fetchUserData({ required String localId }) async {
    userData = (await _fetchUserDataUseCase.execute(localId: localId)) as UserEntity?;
  }

  @override
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