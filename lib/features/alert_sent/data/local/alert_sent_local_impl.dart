import 'package:pabitra_security/features/alert_sent/data/local/alert_sent_local.dart';
import 'package:pabitra_security/shared/storage/shared_preferences/shared_preferences_service.dart';

class AlertSentLocalImpl implements AlertSentLocal {
  final SharedPreferencesService prefs;
  AlertSentLocalImpl(this.prefs);
}
