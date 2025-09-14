import 'package:flutter/material.dart';

class AlertState {
  final bool isLoading;
  final bool isSent;
  final String? username;
  final TextEditingController alertTypeController;

  AlertState({
    this.isLoading = false,
    this.isSent = false,
    this.username,
    TextEditingController? alertTypeController,
  }) : alertTypeController = alertTypeController ?? TextEditingController();

  AlertState copyWith({
    bool? isLoading,
    bool? isSent,
    String? username,
    TextEditingController? alertTypeController,
  }) {
    return AlertState(
      isLoading: isLoading ?? this.isLoading,
      isSent: isSent ?? this.isSent,
      username: username ?? this.username,
      alertTypeController: alertTypeController ?? this.alertTypeController,
    );
  }
}
