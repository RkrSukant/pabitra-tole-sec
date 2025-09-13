import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pabitra_security/di/service_locator.dart';
import 'package:pabitra_security/routes/app_route.dart';
import 'package:pabitra_security/shared/helpers/app_theme.dart';
import 'package:pabitra_security/shared/helpers/strings.dart';
import 'di/service_locator.dart' as di;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
//  String msgToken = await messaging.getToken() as String;
//  print(msgToken);
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.setUpServiceLocator();
  await Firebase.initializeApp();
  // await FirebaseRemoteConfigService.instance.init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
  }

  @override
  void dispose() {
    super.dispose();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: Consumer(builder: (context, ref, child) {
      return MaterialApp.router(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        theme: AppTheme.define(),
        routerConfig: appRoute.config(
          navigatorObservers: () => [
            AutoRouteObserver(),
          ],
        ),
      );
    }));
  }
}
