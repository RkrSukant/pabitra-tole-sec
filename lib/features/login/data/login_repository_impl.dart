import 'package:pabitra_security/features/login/data/login_repository.dart';
import 'package:pabitra_security/features/login/data/local/login_local.dart';
import 'package:pabitra_security/features/login/data/remote/login_remote.dart';
import 'package:pabitra_security/di/service_locator.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginLocal _local = locator<LoginLocal>();
  final LoginRemote _remote = locator<LoginRemote>();

  @override
  Future<bool> checkPhoneNumber(String phoneNumber) async {
    final user = await _remote.checkPhoneNumber(phoneNumber);
    if (user != null) {
      await _local.setLogin();
      await _local.saveUser(user);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> savePhoneNumber(String phoneNumber) =>
      _local.savePhoneNumber(phoneNumber);

  @override
  Future<String?> getPhoneNumber() => _local.getPhoneNumber();

  @override
  Future<void> logout() async {
    _local.logout();
  }
}
