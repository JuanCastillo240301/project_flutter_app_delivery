

import 'package:project_flutter_app_delivery/src/Managers/PlacesManager/Decodables/PlaceList/PlaceListDecodable.dart';
import 'package:project_flutter_app_delivery/src/Managers/PlacesManager/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/Managers/PlacesManager/PlacesManager.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';

class DefaultPlaceListRepository extends PlaceListRepository {
  
  // * Dependencies
  final PlacesManager _placesManager;

  DefaultPlaceListRepository({ PlacesManager? placesManager })
        : _placesManager = placesManager ?? DefaultPlacesManager();

  @override
  Future<PlaceListDecodable> fetchPlaceList() async {
    return _placesManager.fetchPlaceList();
  }

  @override
  Future<PlaceListDecodable> fetchNoveltyPlaceList() {
    return _placesManager.fetchNoveltyPlaceList();
  }

  @override
  Future<PlaceListDecodable> fetchPopularPlacesList() {
    return _placesManager.fetchPopularPlacesList();
  }

  @override
  Future<PlaceListDecodable> fetchPlacesListByCategory({ required int categoryId }) {
    return _placesManager.fetchPlacesListByCategory(categoryId: categoryId);
  }

  @override
  Future<PlaceListDecodable> fetchPlacesListByQuery({ required String query }) {
    return _placesManager.fetchPlacesListByQuery(query: query);
  }

  @override
  Future<PlaceListDecodable> fetchPlacesListByRecentSearches({ required List<String> placeIds }) {
    return _placesManager.fetchPlacesListByRecentSearches(placeIds: placeIds);
  }
}