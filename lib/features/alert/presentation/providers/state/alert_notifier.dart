import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/alert/data/alert_repository.dart';
import 'package:pabitra_security/features/alert/presentation/providers/state/alert_state.dart';

class AlertNotifier extends StateNotifier<AlertState> {
  final AlertRepository _repository;

  AlertNotifier(this._repository) : super(AlertState.initial());

  /// fetches all houses from users collection and updates state
  Future<void> loadHouses() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final houses = await _repository.getAllHouses();
      state = state.copyWith(isLoading: false, houses: houses);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> sendAlert(String type, {required String house}) async {
    state = state.copyWith(isLoading: true, error: null, isSent: false);
    try {
      final id = await _repository.sendAlert(
        type: type,
        house: house,
      );
      state = state.copyWith(isLoading: false, isSent: true, lastAlertId: id);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// optional: set phone/user info after login
  void setUser({String? username, String? phone}) {
    state = state.copyWith(username: username, phone: phone);
  }

  /// optional: reset sent state (so “Alert Sent!” hides after a while)
  void resetSent() {
    state = state.copyWith(isSent: false);
  }
}
