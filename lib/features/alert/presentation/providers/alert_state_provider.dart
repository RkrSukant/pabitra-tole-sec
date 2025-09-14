import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/alert/data/alert_repository.dart';

class AlertState {
  final bool isLoading;
  final bool isSent;
  final String? username;
  final List<String> houses;

  AlertState({
    this.isLoading = false,
    this.isSent = false,
    this.username,
    this.houses = const [],
  });

  AlertState copyWith({
    bool? isLoading,
    bool? isSent,
    String? username,
    List<String>? houses,
  }) {
    return AlertState(
      isLoading: isLoading ?? this.isLoading,
      isSent: isSent ?? this.isSent,
      username: username ?? this.username,
      houses: houses ?? this.houses,
    );
  }
}

class AlertNotifier extends StateNotifier<AlertState> {
  final AlertRepository _repository = locator<AlertRepository>();
  final String _userId = "user123"; // get from auth state

  AlertNotifier() : super(AlertState()) {
    _loadHouses();
  }

  Future<void> _loadHouses() async {
    final houses = await _repository.fetchHouseNumbers();
    state = state.copyWith(houses: houses);
  }

  Future<void> sendAlert(String type, {String? house}) async {
    state = state.copyWith(isLoading: true);
    await _repository.sendAlert(_userId, type, house: house);
    state = state.copyWith(isLoading: false, isSent: true);
  }
}

final alertNotifierProvider =
StateNotifierProvider<AlertNotifier, AlertState>((ref) => AlertNotifier());
