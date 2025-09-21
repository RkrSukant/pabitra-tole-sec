import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/landing/data/landing_repository.dart';
import 'package:pabitra_security/features/landing/presentation/providers/state/landing_state.dart';

class LandingNotifier extends StateNotifier<LandingState>{
  LandingNotifier():super(const LandingState.initial());

  final LandingRepository _repository = locator<LandingRepository>();

  void checkIfLoggedIn(Function(bool) callback) async{
    bool isLoggedIn = await _repository.checkIfLoggedIn();
    callback(isLoggedIn);
  }
}