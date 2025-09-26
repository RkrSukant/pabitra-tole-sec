import 'package:pabitra_security/features/alert/data/model/alert_response_model.dart';
import 'package:pabitra_security/features/login/data/model/user_model.dart';

abstract class AlertRepository {
  Future<AlertModel> sendAlert({
    required String type,
  });

  Future<List<String>> getAllHouses();

  Future<UserInfo> getUserInfo();
}
