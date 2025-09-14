import 'package:pabitra_security/features/alert_detail/data/alert_detail_repository.dart';
import 'package:pabitra_security/features/alert_detail/data/remote/alert_detail_remote.dart';

class AlertDetailRepositoryImpl implements AlertDetailRepository {
  final AlertDetailRemote remote;
  AlertDetailRepositoryImpl(this.remote);

  @override
  Future<Map<String, dynamic>> fetchAlertDetail(String alertId) {
    return remote.fetchAlertDetail(alertId);
  }

  @override
  Future<void> respondToAlert(String alertId, bool coming) {
    return remote.respondToAlert(alertId, coming);
  }
}
