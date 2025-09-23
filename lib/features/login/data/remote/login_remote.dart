import 'package:pabitra_security/features/login/data/model/user_model.dart';

abstract class LoginRemote {
  Future<UserInfo?> checkPhoneNumber(String phoneNumber);
}
