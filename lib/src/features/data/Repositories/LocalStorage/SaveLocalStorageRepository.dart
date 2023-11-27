import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultSaveLocalStorageRepository extends SaveLocalStorageRepository {

  // * Dependencies
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> saveInLocalStorage({ required String key,
                                    required String value }) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  @override
  Future<void> saveRecentSearchInLocalStorage({ required String key, required List<String> value}) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setStringList(key, value);
  }
}