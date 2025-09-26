import 'package:pabitra_security/features/login/data/model/user_model.dart';

abstract class AlertLocal {
  String getUserName();

  String getPhoneNumber();

  Future<UserInfo> getUserInfo();
}
