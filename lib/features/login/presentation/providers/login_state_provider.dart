import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/login/data/login_repository.dart';
import 'package:pabitra_security/features/login/presentation/providers/state/login_notifier.dart';
import 'state/login_state.dart';

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final repo = locator<LoginRepository>();
  return LoginNotifier(repo);
});
