// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:pabitra_security/features/alert/presentation/screens/alert_screen.dart'
    as _i1;
import 'package:pabitra_security/features/alert_sent/presentation/screens/alert_sent_screen.dart'
    as _i2;
import 'package:pabitra_security/features/landing/presentation/screens/splash_screen.dart'
    as _i4;
import 'package:pabitra_security/features/login/presentation/screens/login_screen.dart'
    as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AlertRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AlertScreen(),
      );
    },
    AlertSentRoute.name: (routeData) {
      final args = routeData.argsAs<AlertSentRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AlertSentScreen(
          key: args.key,
          alertId: args.alertId,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AlertScreen]
class AlertRoute extends _i5.PageRouteInfo<void> {
  const AlertRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AlertRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlertRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AlertSentScreen]
class AlertSentRoute extends _i5.PageRouteInfo<AlertSentRouteArgs> {
  AlertSentRoute({
    _i6.Key? key,
    required String alertId,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AlertSentRoute.name,
          args: AlertSentRouteArgs(
            key: key,
            alertId: alertId,
          ),
          initialChildren: children,
        );

  static const String name = 'AlertSentRoute';

  static const _i5.PageInfo<AlertSentRouteArgs> page =
      _i5.PageInfo<AlertSentRouteArgs>(name);
}

class AlertSentRouteArgs {
  const AlertSentRouteArgs({
    this.key,
    required this.alertId,
  });

  final _i6.Key? key;

  final String alertId;

  @override
  String toString() {
    return 'AlertSentRouteArgs{key: $key, alertId: $alertId}';
  }
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
