import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/alert_detail/presentation/providers/state/alert_detail_notifier.dart';
import 'package:pabitra_security/features/alert_detail/presentation/providers/state/alert_detail_state.dart';
import 'package:pabitra_security/features/alert_detail/data/alert_detail_repository.dart';

final alertDetailNotifierProvider =
StateNotifierProvider.family<AlertDetailNotifier, AlertDetailState, String>((ref, alertId) {
  final repo = locator<AlertDetailRepository>();
  return AlertDetailNotifier(repo, alertId);
});
