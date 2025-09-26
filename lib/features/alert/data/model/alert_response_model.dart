import 'package:cloud_firestore/cloud_firestore.dart';

class AlertModel {
  final String id;
  final String house;
  final String senderName;
  final String senderPhone;
  final String type;
  final DateTime timestamp;

  AlertModel({
    required this.id,
    required this.house,
    required this.senderName,
    required this.senderPhone,
    required this.type,
    required this.timestamp,
  });

  factory AlertModel.fromMap(String id, Map<String, dynamic> data) {
    return AlertModel(
      id: id,
      house: data['house'] ?? '',
      senderName: data['senderName'] ?? '',
      senderPhone: data['senderPhone'] ?? '',
      type: data['type'] ?? '',
      timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'house': house,
      'senderName': senderName,
      'senderPhone': senderPhone,
      'type': type,
      'timestamp': timestamp,
    };
  }
}
