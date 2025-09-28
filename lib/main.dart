import 'dart:io';
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

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Request notification permission (Android 13+ and iOS)
  await FirebaseMessaging.instance.requestPermission();

  // Subscribe to alerts topic
  FirebaseMessaging.instance.subscribeToTopic('alerts');
}

Future<void> _initLocalNotifications() async {
  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidInit);

  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      final alertId = response.payload ?? '';
      if (alertId.isNotEmpty) {
        locator<AppRouter>().push(AlertDetailRoute(alertId: alertId));
      }
    },
  );
}

Future<void> _handleInitialMessage() async {
  final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    final alertId = initialMessage.data['alertId'] ?? '';
    if (alertId.isNotEmpty) {
      locator<AppRouter>().push(AlertDetailRoute(alertId: alertId));
    }
  }
}

Future<void> _listenForegroundMessages() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    // Skip showing notification if sender is me
    final myPhone = await locator<LoginRepository>().getPhoneNumber();
    final senderPhone = message.data['senderPhone'];
    if (myPhone != null && senderPhone == myPhone) return;

    final alertId = message.data['alertId'] ?? '';

    const androidDetails = AndroidNotificationDetails(
      'alert_channel_v2', // new channel id
      'Alerts',
      channelDescription: 'Notifications for alerts',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('siren'), // siren.mp3 in /res/raw
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
}

/// Request POST_NOTIFICATIONS permission explicitly on Android 13+
Future<void> _ensureNotificationPermission() async {
  if (Platform.isAndroid) {
    // Since Flutter 3.13+ you can use this directly:
    final settings = await FirebaseMessaging.instance.requestPermission();
    // On Android, requestPermission() already covers POST_NOTIFICATIONS.
    // If you want to be extra sure, use permission_handler package.
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setUpServiceLocator();
  await _initFirebase();
  await _ensureNotificationPermission();
  await _initLocalNotifications();
  await _listenForegroundMessages();
  await _handleInitialMessage();

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
