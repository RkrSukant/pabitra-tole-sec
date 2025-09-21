import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/landing/data/local/landing_local.dart';
import 'package:pabitra_security/shared/storage/shared_preferences/shared_preferences_service.dart';

class LandingLocalImpl implements LandingLocal {

  final SharedPreferencesService _prefs = locator<SharedPreferencesService>();

  @override
  Future<bool> checkIfLoggedIn() async{
    return _prefs.getIsLoggedIn() ?? false;
  }
}