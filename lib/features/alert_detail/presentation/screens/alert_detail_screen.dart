import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/alert_detail/presentation/providers/alert_detail_state_provider.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.whiteFFFFFF),
          onPressed: () => context.router.pop(),
        ),
        title: const Text(
          'Alert Detail',
          style: textFFFFFFs16w600,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_24),
        child: state.isLoading
            ? const Center(
            child: CircularProgressIndicator(color: AppColors.whiteFFFFFF))
            : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(Dimens.spacing_16),
              decoration: BoxDecoration(
                color: AppColors.whiteFFFFFF.withAlpha(20),
                borderRadius: BorderRadius.circular(Dimens.spacing_12),
              ),
              child: Column(
                children: [
                  Text(
                    state.name ?? '',
                    style: textFFFFFFs16w600,
                  ),
                  addVerticalSpace(Dimens.spacing_8),
                  Text(
                    'House: ${state.house ?? ''}',
                    style: textFFFFFFs14w400,
                  ),
                  addVerticalSpace(Dimens.spacing_8),
                  Text(
                    'Type: ${state.type ?? ''}',
                    style: textFFFFFFs14w400,
                  ),
                ],
              ),
            ),
            addVerticalSpace(Dimens.spacing_32),
            Image.asset(ImageConstants.icAlert, height: 100),
            addVerticalSpace(Dimens.spacing_32),
            if (state.isResponding)
              const CircularProgressIndicator(color: AppColors.whiteFFFFFF)
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: AppColors.primary,
                    ),
                    onPressed: () => notifier.respond(true),
                    child: const Text("I'm coming!"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: AppColors.primary,
                    ),
                    onPressed: () => notifier.respond(false),
                    child: const Text("I can't make it"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
