import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/landing/data/landing_repository.dart';
import 'package:pabitra_security/features/landing/data/local/landing_local.dart';

class LandingRepositoryImpl implements LandingRepository {

  final LandingLocal _local = locator<LandingLocal>();

  @override
  Future<bool> checkIfLoggedIn() {
    return _local.checkIfLoggedIn();
  }
}