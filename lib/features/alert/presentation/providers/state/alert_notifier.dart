import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/alert/data/alert_repository.dart';
import '../state/alert_state.dart';

class AlertNotifier extends StateNotifier<AlertState> {
  final AlertRepository repository;
  final String userId;

  AlertNotifier(this.repository, this.userId) : super(AlertState(username: "Test User"));

  Future<void> sendAlert() async {
    state = state.copyWith(isLoading: true);
    await repository.sendAlert(userId, state.alertTypeController.text);
    state = state.copyWith(isLoading: false, isSent: true);
  }
}
