import 'package:pabitra_security/features/alert_sent/data/alert_sent_repository.dart';
import 'package:pabitra_security/features/alert_sent/data/remote/alert_sent_remote.dart';
import 'package:pabitra_security/features/alert_sent/presentation/providers/state/alert_sent_state.dart';
import 'package:pabitra_security/di/service_locator.dart';

class AlertSentRepositoryImpl implements AlertSentRepository {
  final AlertSentRemote remote = locator<AlertSentRemote>();

  @override
  Future<AlertSentData> getAlertDetails(String alertId) {
    return remote.fetchAlertDetails(alertId);
  }
}
