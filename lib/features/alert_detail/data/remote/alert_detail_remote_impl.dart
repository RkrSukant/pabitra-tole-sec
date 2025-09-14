import 'package:pabitra_security/features/alert_detail/data/remote/alert_detail_remote.dart';

class AlertDetailRemoteImpl implements AlertDetailRemote {
  @override
  Future<Map<String, dynamic>> fetchAlertDetail(String alertId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return {
      'name': 'John Doe',
      'house': 'House #53',
      'type': 'FIRE',
      'alertId': alertId
    };
  }

  @override
  Future<void> respondToAlert(String alertId, bool coming) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
