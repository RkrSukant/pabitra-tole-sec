abstract class LoginRepository {
  Future<void> logout();
  Future<bool> checkPhoneNumber(String phoneNumber);
  Future<void> savePhoneNumber(String phoneNumber);
  Future<String?> getPhoneNumber();
}
