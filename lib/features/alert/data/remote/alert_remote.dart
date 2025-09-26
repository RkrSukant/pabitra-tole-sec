import 'package:pabitra_security/features/alert/data/model/alert_response_model.dart';

abstract class AlertRemote {
  Future<AlertModel> sendAlert({
    required String senderName,
    required String senderPhone,
    required String type,
    required String house,
  });

  Future<List<String>> getAllHouses();
}
