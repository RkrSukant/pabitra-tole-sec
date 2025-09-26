import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/alert/data/alert_repository.dart';
import 'package:pabitra_security/features/alert/data/model/alert_response_model.dart';
import 'package:pabitra_security/features/alert/presentation/providers/state/alert_state.dart';
import 'package:pabitra_security/features/login/data/model/user_model.dart';

class AlertNotifier extends StateNotifier<AlertState> {
  final AlertRepository _repository;

  AlertNotifier(this._repository) : super(AlertState.initial());

  Future<void> initializeAlertScreen() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final houses = await _repository.getAllHouses();
      UserInfo user = await _repository.getUserInfo();
      state =
          state.copyWith(isLoading: false, houses: houses, username: user.name);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadHouses() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final houses = await _repository.getAllHouses();
      state = state.copyWith(isLoading: false, houses: houses);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> sendAlert(String type, Function(AlertModel alertModel) callback) async {
    state = state.copyWith(isLoading: true, error: null, isSent: false);
    try {
      AlertModel model = await _repository.sendAlert(
        type: type,
      );
      state = state.copyWith(isLoading: false, isSent: true, lastAlertId: model);
      callback(model);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void setUser({String? username, String? phone}) {
    state = state.copyWith(username: username, phone: phone);
  }

  void resetSent() {
    state = state.copyWith(isSent: false);
  }
}
