import 'package:pabitra_security/features/alert_sent/data/remote/alert_sent_remote.dart';
import 'package:pabitra_security/features/alert_sent/presentation/providers/state/alert_sent_state.dart';

class AlertSentRemoteImpl implements AlertSentRemote {
  @override
  Future<AlertSentData> fetchAlertDetails(String alertId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return AlertSentData(
      id: alertId,
      senderName: 'Sukant Rajkarnikar',
      houseNumber: '51',
      type: 'FIRE',
      comingCount: 3,
      notComingCount: 1,
    );
  }
}
