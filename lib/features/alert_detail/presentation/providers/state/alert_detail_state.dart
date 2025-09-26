import 'package:pabitra_security/features/alert/data/model/alert_response_model.dart';

class AlertDetailState {
  final bool isLoading;
  final bool isResponding;
  final String? error;
  final AlertModel? alert;        // <— changed to AlertModel instead of Map
  final bool hasResponded;
  final bool? respondedComing;

  const AlertDetailState({
    this.isLoading = false,
    this.isResponding = false,
    this.error,
    this.alert,
    this.hasResponded = false,
    this.respondedComing,
  });

  AlertDetailState copyWith({
    bool? isLoading,
    bool? isResponding,
    String? error,
    AlertModel? alert,
    bool? hasResponded,
    bool? respondedComing,
  }) {
    return AlertDetailState(
      isLoading: isLoading ?? this.isLoading,
      isResponding: isResponding ?? this.isResponding,
      error: error,
      alert: alert ?? this.alert,
      hasResponded: hasResponded ?? this.hasResponded,
      respondedComing: respondedComing ?? this.respondedComing,
    );
  }

  factory AlertDetailState.initial() => const AlertDetailState();
}
