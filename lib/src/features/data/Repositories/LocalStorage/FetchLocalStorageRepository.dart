
import 'package:project_flutter_app_delivery/src/Base/Constants/LocalStorageKeys.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultFetchLocalStorageRepository extends FetchLocalStorageRepository {

  // * Dependencies
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<String?> fetchInLocalStorage({ required String key }) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  @override
  Future<List<String>?> fetchRecentSearches() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList(LocalStorageKeys.recentSearches);
  }
}
