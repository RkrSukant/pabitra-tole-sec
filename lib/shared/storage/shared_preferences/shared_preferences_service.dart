import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pabitra_security/shared/storage/shared_preferences/pref_constants.dart';

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

  //Example
  Future<void> setExample(String example) async {
    await _sharedPref?.setString(PrefConstants.example, example);
  }

  String? getExample() {
    return _sharedPref?.getString(PrefConstants.example);
  }
}
