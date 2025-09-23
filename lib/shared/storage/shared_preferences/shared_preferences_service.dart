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

  Future<void> setIsLoggedIn(bool isLoggedIn) async {
    await _sharedPref?.setBool(PrefConstants.isLoggedIn, isLoggedIn);
  }

  bool? getIsLoggedIn() {
    return _sharedPref?.getBool(PrefConstants.isLoggedIn);
  }

  Future<void> setPhoneNumber(String phoneNumber) async {
    await _sharedPref?.setString(PrefConstants.phoneNumber, phoneNumber);
  }

  String? getPhoneNumber() {
    return _sharedPref?.getString(PrefConstants.phoneNumber);
  }

  Future<void> setUserName(String userName) async {
    await _sharedPref?.setString(PrefConstants.userName, userName);
  }

  String? getUserName() {
    return _sharedPref?.getString(PrefConstants.userName);
  }

  Future<void> setHouseNumber(String houseNumber) async {
    await _sharedPref?.setString(PrefConstants.houseNumber, houseNumber);
  }

  String? getHouseNumber() {
    return _sharedPref?.getString(PrefConstants.houseNumber);
  }
}
