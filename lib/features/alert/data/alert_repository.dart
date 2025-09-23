import 'package:pabitra_security/features/login/data/model/user_model.dart';

abstract class AlertRepository {
  Future<String> sendAlert({
    required String type,
  });

  Future<List<String>> getAllHouses();

  Future<UserInfo> getUserInfo();
}
