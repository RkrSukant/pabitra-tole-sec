import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/alert_detail/presentation/providers/alert_detail_state_provider.dart';
import 'package:pabitra_security/features/alert_detail/presentation/providers/state/alert_detail_state.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/image_constants.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';
import 'package:pabitra_security/shared/helpers/utils.dart';

@RoutePage()
class AlertDetailScreen extends ConsumerWidget {
  final String alertId;
  const AlertDetailScreen({super.key, @PathParam('alertId') required this.alertId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(alertDetailNotifierProvider(alertId));
    final notifier = ref.read(alertDetailNotifierProvider(alertId).notifier);

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {
            notifier.loadAlert(alertId);
          }, icon: const Icon(Icons.refresh, color: Colors.white))
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => context.router.pop(),
        ),
        title: const Text('Alert Detail', style: textFFFFFFs16w600),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_24),
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator(color: Colors.white))
            : state.error != null
            ? Center(child: Text(state.error!, style: textFFFFFFs16w600))
            : state.alertData == null
            ? const Center(child: Text('No alert data', style: textFFFFFFs16w600))
            : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(Dimens.spacing_16),
              decoration: BoxDecoration(
                color: AppColors.whiteFFFFFF.withAlpha(20),
                borderRadius: BorderRadius.circular(Dimens.spacing_12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.alertData?['senderName'] ??
                        state.alertData?['senderPhone'] ??
                        '',
                    style: textFFFFFFs16w600,
                  ),
                  addVerticalSpace(Dimens.spacing_8),
                  Text(
                    'House: ${state.alertData?['house'] ?? ''}',
                    style: textFFFFFFs14w400,
                  ),
                  addVerticalSpace(Dimens.spacing_8),
                  Text(
                    'Type: ${state.alertData?['type'] ?? ''}',
                    style: textFFFFFFs14w400,
                  ),
                ],
              ),
            ),
            addVerticalSpace(Dimens.spacing_24),
            Center(child: Image.asset(ImageConstants.icAlert, height: 100)),
            addVerticalSpace(Dimens.spacing_24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '${state.alertData?['comingCount'] ?? 0}',
                      style: textFFFFFFs20w700.copyWith(color: Colors.greenAccent),
                    ),
                    addVerticalSpace(Dimens.spacing_8),
                    Text('Coming', style: textFFFFFFs12w400),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${state.alertData?['notComingCount'] ?? 0}',
                      style: textFFFFFFs20w700.copyWith(color: Colors.redAccent),
                    ),
                    addVerticalSpace(Dimens.spacing_8),
                    Text('Not Coming', style: textFFFFFFs12w400),
                  ],
                ),
              ],
            ),
            addVerticalSpace(Dimens.spacing_32),
            if (state.isResponding)
              const Center(child: CircularProgressIndicator(color: Colors.white))
            else if (state.hasResponded)
              Center(
                child: Text(
                  state.respondedComing == true ? "You responded: I'm coming" : "You responded: I can't make it",
                  style: textFFFFFFs16w600,
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: AppColors.primary,
                      minimumSize: const Size(140, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.spacing_12),
                      ),
                    ),
                    onPressed: () => notifier.respond(alertId, true),
                    child: const Text("I'm coming!"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: AppColors.primary,
                      minimumSize: const Size(140, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.spacing_12),
                      ),
                    ),
                    onPressed: () => notifier.respond(alertId, false),
                    child: const Text("I can't make it"),
                  ),
                ],
              ),
            addVerticalSpace(Dimens.spacing_16),
          ],
        ),
      ),
    );
  }
}
