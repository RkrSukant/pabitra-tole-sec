import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/login/data/login_repository.dart';
import 'package:pabitra_security/features/login/presentation/providers/state/login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginRepository _repository;
  LoginNotifier(this._repository) : super(LoginState.initial());

  Future<void> login() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final phone = state.phoneController.text.trim();
      final ok = await _repository.checkPhoneNumber(phone);
      if (ok) {
        state = state.copyWith(isLoading: false, isVerified: true);
      } else {
        state = state.copyWith(
            isLoading: false, error: 'Number not registered');
      }
    } catch (e) {
      state =
          state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void logout() {

    state = LoginState.initial();
  }
}
