import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pabitra_security/features/alert/data/model/alert_response_model.dart';
import 'alert_detail_remote.dart';

class AlertDetailRemoteImpl implements AlertDetailRemote {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<AlertModel?> getAlertById(String alertId) async {
    final docRef = _firestore.collection('alerts').doc(alertId);
    final docSnap = await docRef.get();
    if (!docSnap.exists) return null;

    final data = Map<String, dynamic>.from(docSnap.data() ?? {});
    return AlertModel.fromMap(docSnap.id, data);
  }

  @override
  Future<void> respondToAlert({
    required String alertId,
    required String responderName,
    required String responderPhone,
    required bool coming,
  }) async {
    final docRef = _firestore.collection('alerts').doc(alertId);
    final responseDocRef = docRef.collection('responses').doc(responderPhone);

    await responseDocRef.set({
      'responderName': responderName,
      'responderPhone': responderPhone,
      'coming': coming,
      'timestamp': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    final responsesSnap = await docRef.collection('responses').get();
    final responses = responsesSnap.docs.map((d) => d.data()).toList();
    final comingCount = responses.where((r) => r['coming'] == true).length;
    final notComingCount = responses.where((r) => r['coming'] == false).length;

    await docRef.set({
      'comingCount': comingCount,
      'notComingCount': notComingCount,
    }, SetOptions(merge: true));
  }
}
