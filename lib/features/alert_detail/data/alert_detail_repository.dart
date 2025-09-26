import 'package:pabitra_security/features/alert/data/model/alert_response_model.dart';

abstract class AlertDetailRepository {
  Future<AlertModel?> getAlertById(String alertId);

  Future<void> respondToAlert({
    required String alertId,
    required String responderName,
    required String responderPhone,
    required bool coming,
  });
}
