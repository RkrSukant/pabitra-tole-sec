import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/alert/data/local/alert_local.dart';
import 'package:pabitra_security/features/login/data/model/user_model.dart';
import 'package:pabitra_security/shared/storage/shared_preferences/shared_preferences_service.dart';

class AlertLocalImpl implements AlertLocal {

  SharedPreferencesService sharedPrefs = locator<SharedPreferencesService>();

  @override
  String getUserName() {
    return sharedPrefs.getUserName() ?? "N/A";
  }

  @override
  String getPhoneNumber() {
    return sharedPrefs.getPhoneNumber() ?? "N/A";
  }

  @override
  Future<UserInfo> getUserInfo() async {
    var userName = sharedPrefs.getUserName() ?? "";
    var phoneNumber = sharedPrefs.getPhoneNumber() ?? "";
    var houseNumber = sharedPrefs.getHouseNumber() ?? "";

    return UserInfo(phone: phoneNumber, name: userName, house: houseNumber);
  }
}
