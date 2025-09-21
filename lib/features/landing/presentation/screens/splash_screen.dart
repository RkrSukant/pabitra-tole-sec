import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:pabitra_security/features/landing/presentation/providers/landing_state_provider.dart';
import 'package:pabitra_security/routes/app_route.gr.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/image_constants.dart';
import 'package:pabitra_security/shared/helpers/strings.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';
import 'package:pabitra_security/shared/helpers/utils.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {  // Change here
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    ref.read(landingStateNotifier.notifier).checkIfLoggedIn((state) {
      isLoggedIn = state;
    },);
    Timer(const Duration(seconds: 3), _navigate);
  }

  void _navigate() {
    if (isLoggedIn) {
      context.replaceRoute(const AlertRoute());
    } else {
      context.replaceRoute(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstants.icAppIcon,
              width: Dimens.spacing_216,
              height: Dimens.spacing_216,
            ),
            addVerticalSpace(Dimens.spacing_16),
            const Text(
              Strings.appName,
              style: textFFFFFFs20w600,
            ),
            addVerticalSpace(Dimens.spacing_8),
            const Text(
              Strings.appBy,
              style: textFFFFFFs12w400,
            ),
          ],
        ),
      ),
    );
  }
}
