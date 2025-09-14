import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/alert/data/remote/alert_remote.dart';
import 'alert_repository.dart';

class AlertRepositoryImpl implements AlertRepository {
  final AlertRemote _remote = locator<AlertRemote>();

  @override
  Future<List<String>> fetchHouseNumbers() {
    return _remote.fetchHouseNumbers();
  }

  @override
  Future<void> sendAlert(String userId, String type, {String? house}) {
    return _remote.sendAlert(userId, type, house: house);
  }
}
