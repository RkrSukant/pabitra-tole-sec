import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/alert/data/remote/alert_remote.dart';
import 'package:pabitra_security/remote/api_client.dart';

class AlertRemoteImpl implements AlertRemote {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final ApiClient _apiClient = locator<ApiClient>();

  @override
  Future<String> sendAlert({
    required String senderName,
    required String senderPhone,
    required String type,
    required String house,
  }) async {
    try {

      final Response response = await _apiClient.sendAlert(
        name: senderName,
        senderPhone: senderPhone,
        type: type,
        house: house,
      );

      final alertId = response.data['alertId'] ?? '';
      return alertId.toString();
    } catch (e) {
      throw Exception('Failed to send alert: ${e.toString()}');
    }
  }

  @override
  Future<List<String>> getAllHouses() async {
    final query = await _fireStore.collection('users').get();
    return query.docs
        .map((doc) => (doc.data()['house_number'] as String?) ?? '')
        .where((h) => h.isNotEmpty)
        .toList();
  }
}
