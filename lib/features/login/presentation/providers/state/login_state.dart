import 'package:flutter/material.dart';

class LoginState {
  final TextEditingController phoneController;
  final TextEditingController otpController;

  final bool isLoading;
  final bool isOtpSent;
  final bool isVerified;
  final String? verificationId;
  final String? error;

  const LoginState({
    required this.phoneController,
    required this.otpController,
    this.isLoading = false,
    this.isOtpSent = false,
    this.isVerified = false,
    this.verificationId,
    this.error,
  });

  LoginState copyWith({
    TextEditingController? phoneController,
    TextEditingController? otpController,
    bool? isLoading,
    bool? isOtpSent,
    bool? isVerified,
    String? verificationId,
    String? error,
  }) {
    return LoginState(
      phoneController: phoneController ?? this.phoneController,
      otpController: otpController ?? this.otpController,
      isLoading: isLoading ?? this.isLoading,
      isOtpSent: isOtpSent ?? this.isOtpSent,
      isVerified: isVerified ?? this.isVerified,
      verificationId: verificationId ?? this.verificationId,
      error: error,
    );
  }

  factory LoginState.initial() => LoginState(
    phoneController: TextEditingController(),
    otpController: TextEditingController(),
  );
}
