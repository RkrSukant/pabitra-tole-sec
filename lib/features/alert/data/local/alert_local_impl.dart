import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/alert/data/local/alert_local.dart';
import 'package:pabitra_security/shared/storage/shared_preferences/shared_preferences_service.dart';

class AlertLocalImpl implements AlertLocal {

  SharedPreferencesService sharedPrefs = locator<SharedPreferencesService>();

  @override
  String getUserName(){
    return sharedPrefs.getUserName() ?? "N/A";
  }
}
