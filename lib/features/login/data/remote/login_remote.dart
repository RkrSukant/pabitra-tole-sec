abstract class LoginRemote {
  Future<String?> sendOtp(String phoneNumber);
  Future<bool> verifyOtp(String verificationId, String smsCode);
}
