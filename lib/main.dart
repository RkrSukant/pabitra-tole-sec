import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/features/login/data/login_repository.dart';
import 'package:pabitra_security/routes/app_route.dart';
import 'package:pabitra_security/routes/app_route.gr.dart';
import 'package:pabitra_security/shared/helpers/app_theme.dart';
import 'package:pabitra_security/shared/helpers/strings.dart';
import 'di/service_locator.dart' as di;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Background FCM handler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // Optionally handle data here
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setUpServiceLocator();
  await Firebase.initializeApp();

  // Background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // iOS permission
  await FirebaseMessaging.instance.requestPermission();

  // Subscribe to topic if needed
  FirebaseMessaging.instance.subscribeToTopic('alerts');

  // Init local notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      // The payload is the alertId
      final alertId = response.payload ?? '';
      if (alertId.isNotEmpty) {
        locator<AppRouter>().push(AlertDetailRoute(alertId: alertId));
      }
    },
  );

  // Foreground FCM messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    final myPhone = await locator<LoginRepository>().getPhoneNumber();
    final senderPhone = message.data['senderPhone'];
    if (myPhone != null && senderPhone == myPhone) {
      debugPrint('Skipping notification because sender is me');
      return;
    }
    final alertId = message.data['alertId'] ?? '';

    const androidDetails = AndroidNotificationDetails(
      'alert_channel',
      'Alerts',
      channelDescription: 'Notifications for alerts',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('siren'),
    );

    const platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'Pabitra Alert',
      message.notification?.body ?? 'Someone has sent an alert!',
      platformDetails,
      payload: alertId,
    );
  });

  // Handle app opened from terminated state
  final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    final alertId = initialMessage.data['alertId'] ?? '';
    if (alertId.isNotEmpty) {
      locator<AppRouter>().push(AlertDetailRoute(alertId: alertId));
    }
  }

  // Debug token
  final token = await FirebaseMessaging.instance.getToken();
  debugPrint('Device FCM Token: $token');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRoute = locator<AppRouter>();

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final alertId = message.data['alertId'] ?? '';
      if (alertId.isNotEmpty) {
        appRoute.push(AlertDetailRoute(alertId: alertId));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        theme: AppTheme.define(),
        routerConfig: appRoute.config(
          navigatorObservers: () => [
            AutoRouteObserver(),
          ],
        ),
      ),
    );
  }
}
