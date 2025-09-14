class AlertSentState {
  final bool isLoading;
  final AlertSentData? alert;

  const AlertSentState({
    this.isLoading = false,
    this.alert,
  });

  AlertSentState copyWith({
    bool? isLoading,
    AlertSentData? alert,
  }) {
    return AlertSentState(
      isLoading: isLoading ?? this.isLoading,
      alert: alert ?? this.alert,
    );
  }
}

class AlertSentData {
  final String id;
  final String senderName;
  final String houseNumber;
  final String type;
  final int comingCount;
  final int notComingCount;

  AlertSentData({
    required this.id,
    required this.senderName,
    required this.houseNumber,
    required this.type,
    required this.comingCount,
    required this.notComingCount,
  });
}
