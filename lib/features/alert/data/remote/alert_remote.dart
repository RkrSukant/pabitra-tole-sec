import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AlertRemote {
  Future<String> sendAlert({
    required String senderName,
    required String senderPhone,
    required String type,
    required String house,
  });

  Future<List<String>> getAllHouses();
}
