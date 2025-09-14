abstract class AlertRemote {
  Future<List<String>> fetchHouseNumbers();
  Future<void> sendAlert(String userId, String type, {String? house});
}