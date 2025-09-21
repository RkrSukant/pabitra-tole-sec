class AlertDetailState {
  final bool isLoading;
  final bool isResponding;
  final String? error;
  final Map<String, dynamic>? alertData;
  final bool hasResponded;
  final bool? respondedComing;

  const AlertDetailState({
    this.isLoading = false,
    this.isResponding = false,
    this.error,
    this.alertData,
    this.hasResponded = false,
    this.respondedComing,
  });

  AlertDetailState copyWith({
    bool? isLoading,
    bool? isResponding,
    String? error,
    Map<String, dynamic>? alertData,
    bool? hasResponded,
    bool? respondedComing,
  }) {
    return AlertDetailState(
      isLoading: isLoading ?? this.isLoading,
      isResponding: isResponding ?? this.isResponding,
      error: error,
      alertData: alertData ?? this.alertData,
      hasResponded: hasResponded ?? this.hasResponded,
      respondedComing: respondedComing ?? this.respondedComing,
    );
  }

  factory AlertDetailState.initial() => const AlertDetailState();
}
