import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/alert/data/alert_repository.dart';
import 'package:pabitra_security/features/alert/data/local/alert_local.dart';
import 'package:pabitra_security/features/alert/data/model/alert_response_model.dart';
import 'package:pabitra_security/features/alert/data/remote/alert_remote.dart';
import 'package:pabitra_security/features/login/data/model/user_model.dart';

class AlertRepositoryImpl implements AlertRepository {
  final AlertRemote _remote = locator<AlertRemote>();
  final AlertLocal _local = locator<AlertLocal>();

  @override
  Future<AlertModel> sendAlert({
    required String type,
  }) async {
    UserInfo user = await _local.getUserInfo();
    return _remote.sendAlert(
      senderName: user.name,
      senderPhone: user.phone,
      type: type,
      house: user.house,
    );
  }

  @override
  Future<List<String>> getAllHouses() {
    return _remote.getAllHouses();
  }

  @override
  Future<UserInfo> getUserInfo() async {
    return _local.getUserInfo();
  }
}
