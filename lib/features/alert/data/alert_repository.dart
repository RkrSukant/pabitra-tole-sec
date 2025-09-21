abstract class AlertRepository {
  Future<String> sendAlert({
    required String senderPhone,
    required String type,
    required String house,
  });

  Future<List<String>> getAllHouses();
}
