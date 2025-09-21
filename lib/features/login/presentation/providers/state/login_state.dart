import 'package:flutter/material.dart';

class LoginState {
  final TextEditingController phoneController;
  final bool isLoading;
  final bool isVerified;
  final String? error;

  const LoginState({
    required this.phoneController,
    this.isLoading = false,
    this.isVerified = false,
    this.error,
  });

  LoginState copyWith({
    TextEditingController? phoneController,
    bool? isLoading,
    bool? isVerified,
    String? error,
  }) {
    return LoginState(
      phoneController: phoneController ?? this.phoneController,
      isLoading: isLoading ?? this.isLoading,
      isVerified: isVerified ?? this.isVerified,
      error: error,
    );
  }

  factory LoginState.initial() =>
      LoginState(phoneController: TextEditingController());
}
