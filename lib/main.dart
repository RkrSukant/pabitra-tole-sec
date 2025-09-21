import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/routes/app_route.dart';
import 'package:pabitra_security/routes/app_route.gr.dart';
import 'package:pabitra_security/shared/helpers/app_theme.dart';
import 'package:pabitra_security/shared/helpers/strings.dart';
import 'di/service_locator.dart' as di;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

/// Background handler – needed for FCM
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // You can log/store data here if needed
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setUpServiceLocator();
  await Firebase.initializeApp();

  // Background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Ask permission on iOS
  await FirebaseMessaging.instance.requestPermission();

  // Subscribe to the alerts topic
  FirebaseMessaging.instance.subscribeToTopic('alerts');

  // Init local notifications plugin
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (response) {
      // Always go to AlertDetailScreen with a dummy id
      locator<AppRouter>().push(AlertDetailRoute(alertId: 'test123'));
    },
  );


  // Foreground FCM messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    final androidDetails = AndroidNotificationDetails(
      'alert_channel',
      'Alerts',
      channelDescription: 'Notifications for alerts',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: const RawResourceAndroidNotificationSound('siren'),
    );

    final platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'Pabitra Alert',
      message.notification?.body ?? 'Someone has sent an alert!',
      platformDetails,
      payload: 'alert', // static payload
    );
  });


  // Handle app opened from terminated state
  final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    locator<AppRouter>().push(AlertDetailRoute(alertId: 'test123'));
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
    // Handle notification taps when app in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Always go to AlertDetailScreen with a dummy id
      appRoute.push( AlertDetailRoute(alertId: 'test123'));
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
