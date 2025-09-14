import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/login/data/login_repository.dart';
import 'package:pabitra_security/features/login/presentation/providers/state/login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginRepository _repository;

  LoginNotifier(this._repository) : super(LoginState.initial());

  Future<void> sendOtp() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final phone = state.phoneController.text.trim();
      final verificationId = await _repository.sendOtp(phone);

      if (verificationId == null) {
        // instant verification
        state = state.copyWith(
          isLoading: false,
          isVerified: true,
          isOtpSent: false,
          verificationId: null,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          isOtpSent: true,
          verificationId: verificationId,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> verifyOtp() async {
    final vId = state.verificationId;
    if (vId == null) {
      state = state.copyWith(error: 'Missing verification id');
      return;
    }
    final code = state.otpController.text.trim();

    state = state.copyWith(isLoading: true, error: null);
    try {
      final ok = await _repository.verifyOtp(vId, code);
      state = state.copyWith(isLoading: false, isVerified: ok);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
