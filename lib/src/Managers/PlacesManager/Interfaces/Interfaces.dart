import 'package:project_flutter_app_delivery/src/Managers/PlacesManager/Decodables/PlaceList/PlaceListDecodable.dart';

abstract class PlacesManager {
    Future<PlaceListDecodable> fetchPlaceList();
    Future<PlaceListDecodable> fetchNoveltyPlaceList();
    Future<PlaceListDecodable> fetchPopularPlacesList();
    Future<PlaceListDecodable> fetchPlacesListByCategory({ required int categoryId});
    Future<PlaceListDecodable> fetchPlacesListByQuery({ required String query});
    Future<PlaceListDecodable> fetchPlacesListByRecentSearches({ required List<String> placeIds });
}