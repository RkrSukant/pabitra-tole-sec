import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/alert/data/alert_repository.dart';
import 'package:pabitra_security/features/alert/presentation/providers/state/alert_notifier.dart';
import 'package:pabitra_security/features/alert/presentation/providers/state/alert_state.dart';

final alertNotifierProvider =
StateNotifierProvider<AlertNotifier, AlertState>((ref) {
  final repo = locator<AlertRepository>();
  return AlertNotifier(repo);
});
