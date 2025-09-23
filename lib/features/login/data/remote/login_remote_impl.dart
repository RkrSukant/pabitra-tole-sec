import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pabitra_security/features/login/data/model/user_model.dart';
import 'login_remote.dart';

class LoginRemoteImpl implements LoginRemote {
  final _db = FirebaseFirestore.instance;

  String _normalize(String phone) {
    final p = phone.trim();
    if (p.startsWith('+')) return p;
    return '+977$p';
  }

  @override
  Future<UserInfo?> checkPhoneNumber(String phoneNumber) async {
    final normalized = _normalize(phoneNumber);
    final doc = await _db.collection('users').doc(normalized).get();

    if (!doc.exists) return null;

    final data = doc.data()!;
    return UserInfo(
      phone: normalized,
      name: data['name'] ?? '',
      house: data['house_number'] ?? '',
    );
  }
}
