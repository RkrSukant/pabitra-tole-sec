abstract class AlertDetailRemote {
  Future<Map<String, dynamic>> fetchAlertDetail(String alertId);
  Future<void> respondToAlert(String alertId, bool coming);
}
