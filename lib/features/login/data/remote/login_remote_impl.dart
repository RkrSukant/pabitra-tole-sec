import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_remote.dart';

class LoginRemoteImpl implements LoginRemote {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _normalize(String phone) {
    final p = phone.trim();
    if (p.startsWith('+')) return p;
    return '+977$p';
  }

  @override
  Future<String?> sendOtp(String phoneNumber) async {
    final completer = Completer<String?>();
    final normalized = _normalize(phoneNumber);

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: normalized,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await _auth.signInWithCredential(credential);
            if (!completer.isCompleted) completer.complete('');
          } catch (e) {
            if (!completer.isCompleted) completer.completeError(e);
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          if (!completer.isCompleted) completer.completeError(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          if (!completer.isCompleted) completer.complete(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          if (!completer.isCompleted) completer.complete(verificationId);
        },
      );
    } catch (e) {
      if (!completer.isCompleted) completer.completeError(e);
    }

    return completer.future;
  }

  @override
  Future<bool> verifyOtp(String verificationId, String smsCode) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user != null;
  }
}
