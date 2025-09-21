import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart'; // <-- added
import 'package:pabitra_security/features/alert/presentation/providers/alert_state_provider.dart';
import 'package:pabitra_security/features/alert/presentation/screens/widget/alert_type_dialog.dart';
import 'package:pabitra_security/features/login/presentation/providers/login_state_provider.dart';
import 'package:pabitra_security/routes/app_route.gr.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/image_constants.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';
import 'package:pabitra_security/shared/helpers/utils.dart';

@RoutePage()
class AlertScreen extends ConsumerWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(alertNotifierProvider);
    final notifier = ref.read(alertNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text("Logged in as ${state.username ?? ""}",
            style: textFFFFFFs16w600),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              ref.read(loginNotifierProvider.notifier).logout();

              if (context.mounted) {
                context.replaceRoute(const LoginRoute());
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.spacing_32, vertical: Dimens.spacing_32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        showAlertTypeDialog(
                          context,
                          houses: state.houses,
                          onSelected: (type, house) async {
                            await notifier.sendAlert(type, house: house ?? "");
                            if (context.mounted) {
                              context.pushRoute(
                                AlertSentRoute(alertId: '123'),
                              );
                            }
                          },
                        );
                      },
                      child: state.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Image.asset(ImageConstants.icAlert),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimens.spacing_24),
                      child: Text(
                        "Press button to alert Pabitra Tole Members",
                        style: textFFFFFFs12w400,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Removed the "Alert Sent!" text block
          ],
        ),
      ),
    );
  }
}
