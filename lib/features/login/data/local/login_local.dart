abstract class LoginLocal {
  Future<void> logout();
  Future<void> savePhoneNumber(String phoneNumber);
  Future<void> setLogin();
  Future<String?> getPhoneNumber();
}
