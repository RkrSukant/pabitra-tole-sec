import 'package:pabitra_security/features/alert/data/alert_repository.dart';
import 'package:pabitra_security/features/alert/data/local/alert_local.dart';
import 'package:pabitra_security/features/alert/data/remote/alert_remote.dart';
import 'package:pabitra_security/di/service_locator.dart';

class AlertRepositoryImpl implements AlertRepository {
  final AlertRemote _remote = locator<AlertRemote>();
  final AlertLocal _local = locator<AlertLocal>();

  @override
  Future<String> sendAlert({
    required String type,
    required String house,
  }) {
    String username = _local.getUserName();
    String phoneNumber = _local.getPhoneNumber();
    return _remote.sendAlert(
      senderName: username,
      senderPhone: phoneNumber,
      type: type,
      house: house,
    );
  }

  @override
  Future<List<String>> getAllHouses() {
    return _remote.getAllHouses();
  }
}
