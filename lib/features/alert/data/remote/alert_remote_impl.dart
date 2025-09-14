import 'package:pabitra_security/features/alert/data/remote/alert_remote.dart';

class AlertRemoteImpl implements AlertRemote {
  @override
  Future<List<String>> fetchHouseNumbers() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return ["House #51", "House #52", "House #53"];
  }

  @override
  Future<void> sendAlert(String userId, String type, {String? house}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // Call your API here
  }
}
