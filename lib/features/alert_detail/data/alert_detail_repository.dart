abstract class AlertDetailRepository {
  Future<Map<String, dynamic>?> getAlertById(String alertId);

  Future<void> respondToAlert({
    required String alertId,
    required String responderName,
    required String responderPhone,
    required bool coming,
  });
}
