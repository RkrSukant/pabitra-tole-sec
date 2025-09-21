import 'package:cloud_firestore/cloud_firestore.dart';
import 'alert_detail_remote.dart';

class AlertDetailRemoteImpl implements AlertDetailRemote {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Map<String, dynamic>?> getAlertById(String alertId) async {
    final docRef = _firestore.collection('alerts').doc(alertId);
    final docSnap = await docRef.get();
    if (!docSnap.exists) return null;

    final Map<String, dynamic> data = Map<String, dynamic>.from(docSnap.data() ?? {});

    final responsesSnap = await docRef.collection('responses').get();
    final responses = responsesSnap.docs.map((d) {
      final m = Map<String, dynamic>.from(d.data());
      m['id'] = d.id;
      return m;
    }).toList();

    final comingCount = responses.where((r) => r['coming'] == true).length;
    final notComingCount = responses.where((r) => r['coming'] == false).length;

    data['responses'] = responses;
    data['comingCount'] = comingCount;
    data['notComingCount'] = notComingCount;
    data['id'] = docSnap.id;

    return data;
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
