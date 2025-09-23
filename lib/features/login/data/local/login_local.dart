import 'package:pabitra_security/features/login/data/model/user_model.dart';

abstract class LoginLocal {
  Future<void> logout();

  Future<void> savePhoneNumber(String phoneNumber);

  Future<void> saveUser(UserInfo user);

  Future<void> setLogin();

  Future<String?> getPhoneNumber();
}
