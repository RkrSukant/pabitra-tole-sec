import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/alert_sent/data/alert_sent_repository.dart';
import 'package:pabitra_security/features/alert_sent/presentation/providers/state/alert_sent_state.dart';
import 'package:pabitra_security/di/service_locator.dart';

class AlertSentNotifier extends StateNotifier<AlertSentState> {
  final AlertSentRepository repository = locator<AlertSentRepository>();
  final String alertId;

  AlertSentNotifier(this.alertId) : super(const AlertSentState()) {
    fetchAlertDetails();
  }

  Future<void> fetchAlertDetails() async {
    state = state.copyWith(isLoading: true);
    final alert = await repository.getAlertDetails(alertId);
    state = state.copyWith(alert: alert, isLoading: false);
  }
}
