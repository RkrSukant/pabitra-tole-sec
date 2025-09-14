import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/alert_sent/presentation/providers/state/alert_sent_notifier.dart';
import 'package:pabitra_security/features/alert_sent/presentation/providers/state/alert_sent_state.dart';

final alertSentNotifierProvider =
StateNotifierProvider.family<AlertSentNotifier, AlertSentState, String>(
      (ref, alertId) => AlertSentNotifier(alertId),
);
