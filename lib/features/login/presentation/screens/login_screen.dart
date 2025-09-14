import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/login/presentation/providers/login_state_provider.dart';
import 'package:pabitra_security/features/login/presentation/providers/state/login_state.dart';
import 'package:pabitra_security/routes/app_route.gr.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/image_constants.dart';
import 'package:pabitra_security/shared/helpers/strings.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';
import 'package:pabitra_security/shared/helpers/utils.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginNotifierProvider);
    final notifier = ref.read(loginNotifierProvider.notifier);

    ref.listen<LoginState>(loginNotifierProvider, (prev, next) {
      if (next.isVerified && prev?.isVerified != true) {
        context.replaceRoute(const AlertRoute());
      }
    });

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimens.spacing_32),
              child: Container(
                padding: const EdgeInsets.all(Dimens.spacing_24),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(Dimens.spacing_24),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      ImageConstants.icAppIcon,
                      width: Dimens.spacing_72,
                      height: Dimens.spacing_72,
                    ),
                    addVerticalSpace(Dimens.spacing_16),
                    const Text(Strings.login, style: textFFFFFFs20w700),
                    addVerticalSpace(Dimens.spacing_4),
                    const Text(Strings.loginSubtitle,
                        style: textFFFFFF85s14w400),
                    addVerticalSpace(Dimens.spacing_24),
                    TextField(
                      controller: state.phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixText: '${Strings.phonePrefix} ',
                        filled: true,
                        fillColor: AppColors.primaryDarkColor,
                        hintText: Strings.phoneHint,
                        hintStyle: textFFFFFF54s14w400,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimens.spacing_12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: textFFFFFFs14w400,
                    ),
                    if (state.isOtpSent) ...[
                      addVerticalSpace(Dimens.spacing_16),
                      TextField(
                        controller: state.otpController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: Strings.otpHint,
                          hintStyle: textFFFFFF54s14w400,
                          filled: true,
                          fillColor: AppColors.primaryDarkColor,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Dimens.spacing_12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: textFFFFFFs14w400,
                      ),
                    ],
                    addVerticalSpace(Dimens.spacing_16),
                    ElevatedButton(
                      onPressed: state.isLoading
                          ? null
                          : () {
                              if (!state.isOtpSent) {
                                notifier.sendOtp();
                              } else {
                                notifier.verifyOtp();
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonBlue,
                        minimumSize: const Size.fromHeight(Dimens.spacing_56),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimens.spacing_16),
                        ),
                      ),
                      child: state.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              !state.isOtpSent
                                  ? Strings.sendOtp
                                  : Strings.verifyOtp,
                              style: textFFFFFFs16w600,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(Dimens.spacing_16),
              child: Text(Strings.appBy, style: textFFFFFFs12w600),
            ),
          )
        ],
      ),
    );
  }
}
