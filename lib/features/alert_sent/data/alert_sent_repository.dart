import 'package:pabitra_security/features/alert_sent/presentation/providers/state/alert_sent_state.dart';

abstract class AlertSentRepository {
  Future<AlertSentData> getAlertDetails(String alertId);
}
