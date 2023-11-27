


import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Managers/PlacesManager/Decodables/PlaceList/PlaceListDecodable.dart';
import 'package:project_flutter_app_delivery/src/features/data/Decodables/Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:project_flutter_app_delivery/src/features/data/Decodables/Decodables/Collections/CollectionsDecodable.dart';
import 'package:project_flutter_app_delivery/src/features/data/Decodables/Decodables/User/UserDecodable.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/SignUpRepository/SignUpRepositoryParameters.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/users/UserBodyParameters.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Decodables/SignInDecodable.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Decodables/SignUpDecodable.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Decodables/UpdatePasswordDecodable.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';
// Auth Repositories
abstract class SignInRepository {
  Future<Result<SignInDecodable, Failure>> signIn({ required SignInBodyParameters params });
}
abstract class SignUpRepository {
  Future<Result<SignUpDecodable, Failure>> signUp({ required SignUpRepositoryParameters params });
}

abstract class UpdatePasswordRepository {
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({ required String email });
}

abstract class UserAuthDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData({ required GetUserDataBodyParameters parameters });
}

// User Database Repositories
abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Failure>> saveUserData({ required UserBodyParameters parameters });
}

abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData({ required String localId });
}

// Local Storage
abstract class SaveLocalStorageRepository {
  Future<void> saveInLocalStorage({ required String key, required String value });
    //Future<void> saveInLocalStorage({ required String key, required String value });
  Future<void> saveRecentSearchInLocalStorage({ required String key, required List<String> value });
}

abstract class FetchLocalStorageRepository {
  Future<String?> fetchInLocalStorage({ required String key });
   Future<List<String>?> fetchRecentSearches();
}

abstract class RemoveLocalStorageRepository {
  Future<void> removeInLocalStorage({ required String key });
}
// * Collections Repositories
abstract class CollectionsRepository {
  Future<CollectionsDecodable> fetchCollections();
}
// * Places Repositories
abstract class PlaceListRepository {
  Future<PlaceListDecodable> fetchPlaceList();
  Future<PlaceListDecodable> fetchNoveltyPlaceList();
  Future<PlaceListDecodable> fetchPopularPlacesList();
  Future<PlaceListDecodable> fetchPlacesListByCategory({ required int categoryId });
  Future<PlaceListDecodable> fetchPlacesListByQuery({ required String query });
  Future<PlaceListDecodable> fetchPlacesListByRecentSearches({ required List<String> placeIds });
}
