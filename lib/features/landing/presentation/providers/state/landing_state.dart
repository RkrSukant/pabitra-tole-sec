class LandingState {
  final String? errMessage;

  const LandingState(
      {
        this.errMessage,
      });

  const LandingState.initial(
      {
        this.errMessage = '',
       });

  LandingState copyWith(
      {
        String? errMessage,
       }) {
    return LandingState(
        errMessage: errMessage ?? this.errMessage);
  }
}