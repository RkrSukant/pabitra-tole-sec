import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/features/alert/presentation/providers/alert_state_provider.dart';
import 'package:pabitra_security/features/alert/presentation/screens/widget/alert_type_dialog.dart';
import 'package:pabitra_security/features/login/presentation/providers/login_state_provider.dart';
import 'package:pabitra_security/routes/app_route.gr.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/image_constants.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class AlertScreen extends ConsumerStatefulWidget {
  const AlertScreen({super.key});

  @override
  ConsumerState<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends ConsumerState<AlertScreen> {
  String? _username;
  String? _house;

  @override
  void initState() {
    super.initState();
    _initializeUserData();
  }

  void _initializeUserData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(alertNotifierProvider.notifier).initializeAlertScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(alertNotifierProvider);
    final notifier = ref.read(alertNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          "Logged in as ${_username ?? state.username ?? ''}",
          style: textFFFFFFs16w600,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
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
                            await notifier.sendAlert(
                              type,
                              (alertModel) {
                                if (context.mounted) {
                                  context.pushRoute(
                                    AlertSentRoute(alertModel: alertModel),
                                  );
                                }
                              },
                            );
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
          ],
        ),
      ),
    );
  }
}
