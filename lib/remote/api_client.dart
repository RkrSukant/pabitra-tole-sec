import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(
    BaseOptions(
      baseUrl: 'https://pabitra-alert-server.vercel.app',
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'x-client-type': 'MobileApp',
        'x-api-key': 'mySecretKey123',
      },
    ),
  );

  Future<Response> sendAlert({
    required String name,
    required String senderPhone,
    required String type,
    required String house,
  }) {
    return _dio.post(
      '/send-alert',
      data: {
        'name': name,
        'senderPhone': senderPhone,
        'type': type,
        'house': house,
      },
    );
  }

  Future<Response> getResponses(String alertId) {
    return _dio.get('/alerts/$alertId/responses');
  }

  Future<Response> postResponse({
    required String alertId,
    required String responseText,
  }) {
    return _dio.post(
      '/alerts/$alertId/responses',
      data: {'response': responseText},
    );
  }
}