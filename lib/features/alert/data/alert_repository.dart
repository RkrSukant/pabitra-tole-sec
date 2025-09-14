abstract class AlertRepository {
  Future<List<String>> fetchHouseNumbers();
  Future<void> sendAlert(String userId, String type, {String? house});
}
