import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pabitra_security/routes/route_util.dart';
import 'package:pabitra_security/routes/router_paths.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/strings.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  String? _verificationId;
  bool _codeSent = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _sendOtp() async {
    String phone = _phoneController.text.trim();
    if (phone.isEmpty) {
      Fluttertoast.showToast(msg: "Enter phone number");
      return;
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(msg: e.message ?? "Verification failed");
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
          _codeSent = true;
        });
        Fluttertoast.showToast(msg: "OTP sent to $phone");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  void _verifyOtp() async {
    String otp = _otpController.text.trim();
    if (_verificationId == null || otp.isEmpty) return;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: otp,
    );

    try {
      await _auth.signInWithCredential(credential);
      Fluttertoast.showToast(msg: "Logged in successfully!");
      context.replaceRouteTo(Paths.alertScreen);
    } catch (e) {
      Fluttertoast.showToast(msg: "Invalid OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const AppColors().backGroundColor,
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Strings.appName, style: text1F2024s16w400),
            const SizedBox(height: Dimens.spacing_16),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                prefixText: "+977 ",
              ),
              keyboardType: TextInputType.phone,
            ),
            if (_codeSent) ...[
              const SizedBox(height: Dimens.spacing_16),
              TextField(
                controller: _otpController,
                decoration: const InputDecoration(labelText: "Enter OTP"),
                keyboardType: TextInputType.number,
              ),
            ],
            const SizedBox(height: Dimens.spacing_16),
            ElevatedButton(
              onPressed: _codeSent ? _verifyOtp : _sendOtp,
              child: Text(_codeSent ? "Verify OTP" : "Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
