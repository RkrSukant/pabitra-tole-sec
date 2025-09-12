import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:janakisoft_health_fitness_app/shared/storage/shared_preferences/pref_constants.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _sharedPref;
  static var flutterSecureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  static Future<SharedPreferencesService> getInstance() async {
    _sharedPref ??= await SharedPreferences.getInstance();
    return _instance ??= SharedPreferencesService();
  }

  //is first run
  Future<void> setIsFirstTime(bool isFirstTime) async {
    await _sharedPref?.setBool(PrefConstants.isFirstRun, isFirstTime);
  }
  bool? getIsFirstTime() {
    return _sharedPref?.getBool(PrefConstants.isFirstRun);
  }
}
