import 'package:pabitra_security/features/alert_sent/presentation/providers/state/alert_sent_state.dart';

abstract class AlertSentRemote {
  Future<AlertSentData> fetchAlertDetails(String alertId);
}
