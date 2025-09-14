abstract class LoginRepository {
  Future<String?> sendOtp(String phoneNumber);
  Future<bool> verifyOtp(String verificationId, String smsCode);
  Future<void> savePhoneNumber(String phoneNumber);
  Future<String?> getPhoneNumber();
}
