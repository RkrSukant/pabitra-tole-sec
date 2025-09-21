// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:pabitra_security/features/alert/presentation/screens/alert_screen.dart'
    as _i2;
import 'package:pabitra_security/features/alert_detail/presentation/screens/alert_detail_screen.dart'
    as _i1;
import 'package:pabitra_security/features/alert_sent/presentation/screens/alert_sent_screen.dart'
    as _i3;
import 'package:pabitra_security/features/landing/presentation/screens/splash_screen.dart'
    as _i5;
import 'package:pabitra_security/features/login/presentation/screens/login_screen.dart'
    as _i4;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AlertDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AlertDetailRouteArgs>(
          orElse: () =>
              AlertDetailRouteArgs(alertId: pathParams.getString('alertId')));
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AlertDetailScreen(
          key: args.key,
          alertId: args.alertId,
        ),
      );
    },
    AlertRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AlertScreen(),
      );
    },
    AlertSentRoute.name: (routeData) {
      final args = routeData.argsAs<AlertSentRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AlertSentScreen(
          key: args.key,
          alertId: args.alertId,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AlertDetailScreen]
class AlertDetailRoute extends _i6.PageRouteInfo<AlertDetailRouteArgs> {
  AlertDetailRoute({
    _i7.Key? key,
    required String alertId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AlertDetailRoute.name,
          args: AlertDetailRouteArgs(
            key: key,
            alertId: alertId,
          ),
          rawPathParams: {'alertId': alertId},
          initialChildren: children,
        );

  static const String name = 'AlertDetailRoute';

  static const _i6.PageInfo<AlertDetailRouteArgs> page =
      _i6.PageInfo<AlertDetailRouteArgs>(name);
}

class AlertDetailRouteArgs {
  const AlertDetailRouteArgs({
    this.key,
    required this.alertId,
  });

  final _i7.Key? key;

  final String alertId;

  @override
  String toString() {
    return 'AlertDetailRouteArgs{key: $key, alertId: $alertId}';
  }
}

/// generated route for
/// [_i2.AlertScreen]
class AlertRoute extends _i6.PageRouteInfo<void> {
  const AlertRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AlertRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlertRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AlertSentScreen]
class AlertSentRoute extends _i6.PageRouteInfo<AlertSentRouteArgs> {
  AlertSentRoute({
    _i7.Key? key,
    required String alertId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AlertSentRoute.name,
          args: AlertSentRouteArgs(
            key: key,
            alertId: alertId,
          ),
          initialChildren: children,
        );

  static const String name = 'AlertSentRoute';

  static const _i6.PageInfo<AlertSentRouteArgs> page =
      _i6.PageInfo<AlertSentRouteArgs>(name);
}

class AlertSentRouteArgs {
  const AlertSentRouteArgs({
    this.key,
    required this.alertId,
  });

  final _i7.Key? key;

  final String alertId;

  @override
  String toString() {
    return 'AlertSentRouteArgs{key: $key, alertId: $alertId}';
  }
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
