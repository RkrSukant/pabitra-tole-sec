import 'dart:io';

class FailedResponseException extends IOException {
  final String? message;

  FailedResponseException(this.message);
}

class DeviceLinkException extends IOException {
  final String? message;

  DeviceLinkException(this.message);
}

class DeviceBlockedException extends IOException {
  final String? message;

  DeviceBlockedException(this.message);
}

class CallSyncedFailedException extends IOException {}

class NetworkNotAvailableException implements IOException {
  final String? message;

  NetworkNotAvailableException({required this.message});
}

class NothingToSyncException implements IOException {
  final String? message;

  NothingToSyncException({required this.message});
}

