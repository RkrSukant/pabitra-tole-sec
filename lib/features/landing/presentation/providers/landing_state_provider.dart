import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/landing/presentation/providers/state/landing_notifier.dart';
import 'package:pabitra_security/features/landing/presentation/providers/state/landing_state.dart';

final landingStateNotifier =
StateNotifierProvider<LandingNotifier, LandingState>((ref) {
  return LandingNotifier();
});
