import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/alert_detail/data/alert_detail_repository.dart';
import 'package:pabitra_security/features/alert_detail/presentation/providers/state/alert_detail_state.dart';

class AlertDetailNotifier extends StateNotifier<AlertDetailState> {
  final AlertDetailRepository repository;
  final String alertId;

  AlertDetailNotifier(this.repository, this.alertId)
      : super(AlertDetailState()) {
    fetchDetail();
  }

  Future<void> fetchDetail() async {
    state = state.copyWith(isLoading: true);
    final data = await repository.fetchAlertDetail(alertId);
    state = state.copyWith(
      isLoading: false,
      name: data['name'],
      house: data['house'],
      type: data['type'],
    );
  }

  Future<void> respond(bool coming) async {
    state = state.copyWith(isResponding: true);
    await repository.respondToAlert(alertId, coming);
    state = state.copyWith(isResponding: false);
  }
}
