import 'package:flutter/material.dart';

class AlertDetailState {
  final String? name;
  final String? house;
  final String? type;
  final bool isLoading;
  final bool isResponding;

  AlertDetailState({
    this.name,
    this.house,
    this.type,
    this.isLoading = false,
    this.isResponding = false,
  });

  AlertDetailState copyWith({
    String? name,
    String? house,
    String? type,
    bool? isLoading,
    bool? isResponding,
  }) {
    return AlertDetailState(
      name: name ?? this.name,
      house: house ?? this.house,
      type: type ?? this.type,
      isLoading: isLoading ?? this.isLoading,
      isResponding: isResponding ?? this.isResponding,
    );
  }
}
