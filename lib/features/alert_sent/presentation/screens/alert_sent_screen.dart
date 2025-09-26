import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/alert/data/model/alert_response_model.dart';
import 'package:pabitra_security/features/alert_sent/presentation/providers/alert_sent_state_provider.dart';
import 'package:pabitra_security/routes/route_util.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/image_constants.dart';
import 'package:pabitra_security/shared/helpers/strings.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';
import 'package:pabitra_security/shared/helpers/utils.dart';

@RoutePage()
class AlertSentScreen extends ConsumerWidget {
  final AlertModel alertModel;

  const AlertSentScreen({super.key, required this.alertModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(alertSentNotifierProvider(alertModel.id));
    final notifier = ref.read(
        alertSentNotifierProvider(alertModel.id).notifier);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.spacing_32,
                      vertical: Dimens.spacing_48),
                  child: Icon(
                    Icons.arrow_circle_left_outlined,
                    color: AppColors.whiteFFFFFF,
                    size: Dimens.spacing_24,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.spacing_32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                addVerticalSpace(Dimens.spacing_32),
                const Text(
                  "Alert Sent",
                  style: textFFFFFFs20w700,
                  textAlign: TextAlign.center,
                ),
                addVerticalSpace(Dimens.spacing_24),
                Container(
                  padding: const EdgeInsets.all(Dimens.spacing_16),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(Dimens.spacing_16),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        ImageConstants.icAppIcon,
                        width: Dimens.spacing_64,
                        height: Dimens.spacing_64,
                      ),
                      addVerticalSpace(Dimens.spacing_16),
                      const Text(
                          Strings.alert_sent_msg,
                          textAlign: TextAlign.center,
                          style: textFFFFFFs12w400,),
                      addVerticalSpace(Dimens.spacing_32),
                      Text(
                        'Sender Name: ${alertModel.senderName}',
                        style: textFFFFFFs16w600,
                      ),
                      addVerticalSpace(Dimens.spacing_8),
                      Text(
                        "House No: ${alertModel.house ?? ''}",
                        style: textFFFFFFs14w400,
                      ),
                      addVerticalSpace(Dimens.spacing_4),
                      Text(
                        "Alert Type: ${alertModel.type ?? ''}",
                        style: textFFFFFFs14w400,
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(Dimens.spacing_32),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Column(
                //       children: [
                //         Text(
                //           "${state.alert?.comingCount ?? 0}",
                //           style:
                //               textFFFFFFs20w700.copyWith(color: Colors.green),
                //         ),
                //         addVerticalSpace(Dimens.spacing_4),
                //         const Text(
                //           "Coming",
                //           style: textFFFFFFs12w400,
                //         ),
                //       ],
                //     ),
                //     Column(
                //       children: [
                //         Text(
                //           "${state.alert?.notComingCount ?? 0}",
                //           style: textFFFFFFs20w700.copyWith(color: Colors.red),
                //         ),
                //         addVerticalSpace(Dimens.spacing_4),
                //         const Text(
                //           "Not Coming",
                //           style: textFFFFFFs12w400,
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // addVerticalSpace(Dimens.spacing_24),
                // ElevatedButton(
                //   onPressed: () {
                //     notifier.fetchAlertDetails();
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: AppColors.buttonBlue,
                //     minimumSize: const Size.fromHeight(Dimens.spacing_56),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(Dimens.spacing_16),
                //     ),
                //   ),
                //   child: const Text(
                //     "Refresh",
                //     style: textFFFFFFs16w600,
                //   ),
                // ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(Dimens.spacing_16),
              child: Row(
                children: [
                  Expanded(child: OutlinedButton(onPressed: (){
                    context.pop();
                  }, child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text("Return", style: textFFFFFFs16w600,),
                  ))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
