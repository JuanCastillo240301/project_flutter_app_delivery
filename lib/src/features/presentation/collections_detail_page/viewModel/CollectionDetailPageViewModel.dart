

import 'package:project_flutter_app_delivery/src/features/domain/Entities/Collections/CollectionsEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Places/PlaceListUseCase/FavouritesPlacesUseCase/FavouritesPlacesUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Places/PlaceListUseCase/PlaceListUseCase.dart';

enum CollectionDetailPageViewState { viewLoadedState }

abstract class CollectionDetailPageViewModelInput {
  Future<CollectionDetailPageViewState> viewInitState();
  CollectionDetailEntity getCollection();
  List<PlaceListDetailEntity> filteredPlacesByCategory = [];
}

abstract class CollectionDetailPageViewModel extends CollectionDetailPageViewModelInput {}

class DefaultCollectionDetailPageViewModel extends CollectionDetailPageViewModel {
  // Dependencies
  CollectionDetailEntity collection;
  final PlaceListUseCase _placeListUseCase;
  final FavouritesPlacesUseCase _favouritesPlacesUseCase;

  DefaultCollectionDetailPageViewModel({ required this.collection,
                                         PlaceListUseCase? placeListUseCase,
                                         FavouritesPlacesUseCase? favouritesPlacesUseCase })
      : _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase(),
        _favouritesPlacesUseCase = favouritesPlacesUseCase ?? DefaultFavouritesPlacesUseCase();

  @override
  Future<CollectionDetailPageViewState> viewInitState() async {
    final placesResult = await _placeListUseCase.fetchPlacesListByCategory(
        categoryId: collection.id);
    filteredPlacesByCategory = placesResult.placeList ?? [];
    return CollectionDetailPageViewState.viewLoadedState;
  }

  CollectionDetailEntity getCollection() {
    return collection;
  }
}
