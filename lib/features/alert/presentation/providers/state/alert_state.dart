class AlertState {
  final bool isLoading;
  final bool isSent;
  final String? error;
  final List<String> houses;
  final String? username;
  final String? phone;
  final String? lastAlertId;

  const AlertState({
    this.isLoading = false,
    this.isSent = false,
    this.error,
    this.houses = const [],
    this.username,
    this.phone,
    this.lastAlertId,
  });

  AlertState copyWith({
    bool? isLoading,
    bool? isSent,
    String? error,
    List<String>? houses,
    String? username,
    String? phone,
    String? lastAlertId,
  }) {
    return AlertState(
      isLoading: isLoading ?? this.isLoading,
      isSent: isSent ?? this.isSent,
      error: error,
      houses: houses ?? this.houses,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      lastAlertId: lastAlertId ?? this.lastAlertId,
    );
  }

  factory AlertState.initial() => const AlertState();
}
