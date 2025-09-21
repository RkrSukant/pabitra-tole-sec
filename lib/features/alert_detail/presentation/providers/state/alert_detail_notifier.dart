import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/alert_detail/data/alert_detail_repository.dart';
import 'package:pabitra_security/features/alert_detail/presentation/providers/state/alert_detail_state.dart';
import 'package:pabitra_security/features/login/data/login_repository.dart';

class AlertDetailNotifier extends StateNotifier<AlertDetailState> {
  final AlertDetailRepository _repository;

  AlertDetailNotifier(this._repository) : super(AlertDetailState.initial());

  Future<void> loadAlert(String alertId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _repository.getAlertById(alertId);
      final phone = await _getLocalPhone();
      bool hasResp = false;
      bool? respComing;
      if (data != null && data['responses'] != null && phone != null) {
        final responses = List<Map<String, dynamic>>.from(data['responses']);
        final match = responses.firstWhere(
              (r) => (r['responderPhone'] ?? r['id'] ?? '') == phone,
          orElse: () => {},
        );
        if (match.isNotEmpty) {
          hasResp = true;
          respComing = match['coming'] == true;
        }
      }
      state = state.copyWith(
        isLoading: false,
        alertData: data,
        hasResponded: hasResp,
        respondedComing: respComing,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> respond(String alertId, bool coming) async {
    state = state.copyWith(isResponding: true, error: null);
    try {
      final phone = await _getLocalPhone();
      final loginRepo = locator<LoginRepository>();
      final responderPhone = phone ?? (await loginRepo.getPhoneNumber());
      final responderName = responderPhone ?? '';

      if (responderPhone == null) {
        state = state.copyWith(
            isResponding: false, error: 'Could not determine your phone number');
        return;
      }

      await _repository.respondToAlert(
        alertId: alertId,
        responderName: responderName,
        responderPhone: responderPhone,
        coming: coming,
      );

      await loadAlert(alertId);

      state = state.copyWith(isResponding: false, hasResponded: true, respondedComing: coming);
    } catch (e) {
      state = state.copyWith(isResponding: false, error: e.toString());
    }
  }

  Future<String?> _getLocalPhone() async {
    try {
      final loginRepo = locator<LoginRepository>();
      return await loginRepo.getPhoneNumber();
    } catch (_) {
      return null;
    }
  }
}
