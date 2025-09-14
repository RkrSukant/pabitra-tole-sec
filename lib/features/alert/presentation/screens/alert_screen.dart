import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/alert/presentation/providers/alert_state_provider.dart';
import 'package:pabitra_security/features/alert/presentation/screens/widget/alert_type_dialog.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.spacing_32, vertical: Dimens.spacing_32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            addVerticalSpace(Dimens.spacing_32),
            Text("Logged in as ${state.username ?? ""}",
                style: textFFFFFFs16w600),
            addVerticalSpace(Dimens.spacing_24),
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
                            await notifier.sendAlert(type, house: house);
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
                      padding:
                      EdgeInsets.symmetric(horizontal: Dimens.spacing_24),
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
            if (state.isSent) ...[
              addVerticalSpace(Dimens.spacing_16),
              const Text("Alert Sent!", style: textFFFFFFs14w400),
            ]
          ],
        ),
      ),
    );
  }
}
