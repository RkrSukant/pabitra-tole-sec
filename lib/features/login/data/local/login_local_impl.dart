import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/login/data/model/user_model.dart';
import 'package:pabitra_security/shared/storage/shared_preferences/shared_preferences_service.dart';

import 'login_local.dart';

class LoginLocalImpl implements LoginLocal {
  final SharedPreferencesService _prefs = locator<SharedPreferencesService>();

  @override
  Future<void> savePhoneNumber(String phoneNumber) async {
    await _prefs.setPhoneNumber(phoneNumber);
  }

  @override
  Future<void> setLogin() async {
    await _prefs.setIsLoggedIn(true);
  }

  @override
  Future<String?> getPhoneNumber() async {
    return _prefs.getPhoneNumber();
  }

  @override
  Future<void> logout() async {
    await _prefs.setIsLoggedIn(false);
    await _prefs.setPhoneNumber("");
    await _prefs.setUserName("");
    await _prefs.setHouseNumber("");
  }

  @override
  Future<void> saveUser(UserInfo? user) async {
    await _prefs.setPhoneNumber(user?.phone ?? "N/A");
    await _prefs.setUserName(user?.name ?? "N/A");
    await _prefs.setHouseNumber(user?.house ?? "N/A");
  }
}
