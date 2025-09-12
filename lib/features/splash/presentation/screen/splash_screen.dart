import 'dart:async';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pabitra_security/routes/route_util.dart';
import 'package:pabitra_security/routes/router_paths.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/strings.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.replaceRouteTo(Paths.loginScreen); // Using your context extension
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const AppColors().backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/drawable/ic_app_icon.png",
              width: Dimens.spacing_216,
              height: Dimens.spacing_216,
            ),
            const SizedBox(height: Dimens.spacing_16),
            const Text(
              Strings.appName,
              style: text1F2024s16w400,
            ),
          ],
        ),
      ),
    );
  }
}
