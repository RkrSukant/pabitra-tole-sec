import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pabitra_security/routes/app_route.gr.dart';
import 'package:pabitra_security/routes/router_paths.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/image_constants.dart';
import 'package:pabitra_security/shared/helpers/strings.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';
import 'package:pabitra_security/shared/helpers/utils.dart';

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
      context.replaceRoute(const LoginRoute());
    });
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
            Text(
              Strings.appName,
              style: textFFFFFFs20w600,
            ),
            addVerticalSpace(Dimens.spacing_8),
            Text(
              Strings.appBy,
              style: textFFFFFFs12w400,
            ),
          ],
        ),
      ),
    );
  }
}
