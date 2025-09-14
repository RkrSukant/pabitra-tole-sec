import 'package:pabitra_security/features/login/data/login_repository.dart';
import 'package:pabitra_security/features/login/data/local/login_local.dart';
import 'package:pabitra_security/features/login/data/remote/login_remote.dart';
import 'package:pabitra_security/di/service_locator.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginLocal _local = locator<LoginLocal>();
  final LoginRemote _remote = locator<LoginRemote>();

  @override
  Future<String?> sendOtp(String phoneNumber) async {
    final verificationId = await _remote.sendOtp(phoneNumber);
    await _local.savePhoneNumber(phoneNumber);
    return verificationId;
  }

  @override
  Future<bool> verifyOtp(String verificationId, String smsCode) async {
    return await _remote.verifyOtp(verificationId, smsCode);
  }

  @override
  Future<void> savePhoneNumber(String phoneNumber) => _local.savePhoneNumber(phoneNumber);

  @override
  Future<String?> getPhoneNumber() => _local.getPhoneNumber();
}
