

import 'package:project_flutter_app_delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Places/PlaceList/PlaceDetail/PlaceDetailRepository.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Places/PlaceListUseCase/PlaceListUseCase.dart';

abstract class FavouritesPlacesUseCase {
  Future<PlaceListEntity> fetchFavouritesPlaces({ required String localId });
  Future<void> saveOrRemoveUserFromPlaceFavourites({ required String placeId,
                                                     required String localId,
                                                     required bool isFavourite });
}

class DefaultFavouritesPlacesUseCase extends FavouritesPlacesUseCase {

   // Dependencies
   final PlaceListUseCase _placeListUseCase;
   final PlaceDetailRepository _placeDetailRepository;
   

   DefaultFavouritesPlacesUseCase({ PlaceListUseCase? placeListUseCase,
                                    PlaceDetailRepository? placeDetailRepository })
    :    _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase(),
         _placeDetailRepository = placeDetailRepository ?? DefaultPlaceDetailRepository();

  @override
  Future<PlaceListEntity> fetchFavouritesPlaces({ required String localId }) async {
    var placeList = await _placeListUseCase.fetchPlaceList();
    placeList.placeList = placeList.placeList?.where((place) => place.favourites?.contains(localId) ?? false).toList();
    return placeList;
  }
  
  @override
  Future<void> saveOrRemoveUserFromPlaceFavourites({required String placeId, required String localId, required bool isFavourite}) {
    // TODO: implement saveOrRemoveUserFromPlaceFavourites
    throw UnimplementedError();
  }

  //  @override
  //  Future<void> saveOrRemoveUserFromPlaceFavourites({ required String placeId,
  //                                                     required String localId,
  //                                                     required bool isFavourite}) {
  //    if (isFavourite) {
  //      return _saveUserInFavourites(placeId: placeId, localId: localId);
  //    } else {
  //      return _removeUserFromFavourites(placeId: placeId, localId: localId);
  //    }
  //  }

  // @override
  // Future<void> _saveUserInFavourites({ required String placeId,
  //                                     required String localId }) async {
  //   var placeList = await _placeListUseCase.fetchPlaceList();
  //   var placeDetail = placeList.placeList?.firstWhere( (place) => place.placeId == placeId);
  //   placeDetail?.favourites?.add(localId);
  //   if (placeDetail == null) { return Future.error(AppFailureMessages.unExpectedErrorMessage); }
  //   return _placeDetailRepository.savePlaceDetail(placeDetail: placeDetail);
  // }

  // @override
  // Future<void> _removeUserFromFavourites({ required String placeId,
  //                                         required String localId }) async {
  //   var placeList = await _placeListUseCase.fetchPlaceList();
  //   var placeDetail = placeList.placeList?.firstWhere( (place) => place.placeId == placeId);
  //   placeDetail?.favourites?.remove(localId);
  //   if (placeDetail == null) { return Future.error(AppFailureMessages.unExpectedErrorMessage); }
  //   return _placeDetailRepository.savePlaceDetail(placeDetail: placeDetail);
  // }
}
