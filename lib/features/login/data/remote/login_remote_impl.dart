import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_remote.dart';

class LoginRemoteImpl implements LoginRemote {
  final _db = FirebaseFirestore.instance;

  String _normalize(String phone) {
    final p = phone.trim();
    if (p.startsWith('+')) return p;
    return '+977$p';
  }

  @override
  Future<bool> checkPhoneNumber(String phoneNumber) async {
    final normalized = _normalize(phoneNumber);
    final doc = await _db.collection('users').doc(normalized).get();
    return doc.exists;
  }
}
