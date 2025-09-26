import 'package:pabitra_security/features/alert/data/model/alert_response_model.dart';
import 'package:pabitra_security/features/alert_detail/data/alert_detail_repository.dart';
import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/alert_detail/data/remote/alert_detail_remote.dart';

class AlertDetailRepositoryImpl implements AlertDetailRepository {
  final AlertDetailRemote _remote = locator<AlertDetailRemote>();

  @override
  Future<AlertModel?> getAlertById(String alertId) {
    return _remote.getAlertById(alertId);
  }

  @override
  Future<void> respondToAlert({
    required String alertId,
    required String responderName,
    required String responderPhone,
    required bool coming,
  }) {
    return _remote.respondToAlert(
      alertId: alertId,
      responderName: responderName,
      responderPhone: responderPhone,
      coming: coming,
    );
  }
}
