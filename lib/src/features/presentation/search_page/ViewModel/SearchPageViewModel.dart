
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/FetchLocalStorageUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Places/PlaceListUseCase/PlaceListUseCase.dart';

abstract class SearchPageViewModelInput {
  Future<PlaceListEntity> fetchPlacesListByQuery({ required String query });
  Future<PlaceListEntity> fetchPlacesListByRecentSearches();
  Future<PlaceListEntity> fetchPopularPlacesList();
  Future<void> clearRecentSearchInLocalStorage();
}

abstract class SearchPageViewModelOutput {}

abstract class SearchPageViewModel extends SearchPageViewModelInput with SearchPageViewModelOutput {}

class DefaultSearchPageViewModel extends SearchPageViewModel {

  // Dependencies
  final PlaceListUseCase _placeListUseCase;
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultSearchPageViewModel({ PlaceListUseCase? placeListUseCase,
                               FetchLocalStorageUseCase? fetchLocalStorageUseCase,
                               SaveLocalStorageUseCase? saveLocalStorageUseCase })
     :  _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase(),
        _fetchLocalStorageUseCase = fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  Future<PlaceListEntity> fetchPlacesListByQuery({ required String query }) {
    return _placeListUseCase.fetchPlacesListByQuery(query: query);
  }

  @override
  Future<PlaceListEntity> fetchPlacesListByRecentSearches() async {
    final placeIds = await _fetchLocalStorageUseCase.fetchRecentSearches();
    return _placeListUseCase.fetchPlacesListByRecentSearches(placeIds: placeIds);
  }

  @override
  Future<PlaceListEntity> fetchPopularPlacesList() {
    return _placeListUseCase.fetchPopularPlacesList();
  }

  @override
  Future<void> clearRecentSearchInLocalStorage() {
    return _saveLocalStorageUseCase.clearRecentSearchInLocalStorage();
  }
}
