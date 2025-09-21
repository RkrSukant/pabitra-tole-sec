import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pabitra_security/features/alert/data/alert_repository.dart';
import 'package:pabitra_security/features/alert/data/alert_repository_impl.dart';
import 'package:pabitra_security/features/alert/data/local/alert_local.dart';
import 'package:pabitra_security/features/alert/data/local/alert_local_impl.dart';
import 'package:pabitra_security/features/alert/data/remote/alert_remote.dart';
import 'package:pabitra_security/features/alert/data/remote/alert_remote_impl.dart';
import 'package:pabitra_security/features/alert_detail/data/alert_detail_repository.dart';
import 'package:pabitra_security/features/alert_detail/data/alert_detail_repository_impl.dart';
import 'package:pabitra_security/features/alert_detail/data/remote/alert_detail_remote.dart';
import 'package:pabitra_security/features/alert_detail/data/remote/alert_detail_remote_impl.dart';
import 'package:pabitra_security/features/alert_sent/data/alert_sent_repository.dart';
import 'package:pabitra_security/features/alert_sent/data/alert_sent_repository_impl.dart';
import 'package:pabitra_security/features/alert_sent/data/local/alert_sent_local.dart';
import 'package:pabitra_security/features/alert_sent/data/local/alert_sent_local_impl.dart';
import 'package:pabitra_security/features/alert_sent/data/remote/alert_sent_remote.dart';
import 'package:pabitra_security/features/alert_sent/data/remote/alert_sent_remote_impl.dart';
import 'package:pabitra_security/features/landing/data/landing_repository.dart';
import 'package:pabitra_security/features/landing/data/landing_repository_impl.dart';
import 'package:pabitra_security/features/landing/data/local/landing_local.dart';
import 'package:pabitra_security/features/landing/data/local/landing_local_impl.dart';
import 'package:pabitra_security/features/landing/data/remote/landing_remote.dart';
import 'package:pabitra_security/features/landing/data/remote/landing_remote_impl.dart';
import 'package:pabitra_security/features/login/data/local/login_local.dart';
import 'package:pabitra_security/features/login/data/local/login_local_impl.dart';
import 'package:pabitra_security/features/login/data/login_repository.dart';
import 'package:pabitra_security/features/login/data/login_repository_impl.dart';
import 'package:pabitra_security/features/login/data/remote/login_remote.dart';
import 'package:pabitra_security/features/login/data/remote/login_remote_impl.dart';
import 'package:pabitra_security/routes/app_route.dart';
import 'package:pabitra_security/remote/api_client.dart';
import 'package:pabitra_security/shared/storage/shared_preferences/shared_preferences_service.dart';

final GetIt locator = GetIt.instance;

Future setUpServiceLocator() async {
  //Shared Preferences
  locator.registerSingleton(await SharedPreferencesService.getInstance());

  //Database
  // var databaseManager = await DatabaseManager.getDbInstance();
  // locator.registerLazySingleton(() => databaseManager);

  //dio
  locator.registerLazySingleton<ApiClient>(() => ApiClient());

  //Router
  locator.registerSingleton(AppRouter());


  //Landing
  locator.registerLazySingleton<LandingLocal>(() => LandingLocalImpl());
  locator.registerLazySingleton<LandingRemote>(() => LandingRemoteImpl());
  locator.registerLazySingleton<LandingRepository>(() => LandingRepositoryImpl());

  //Login
  locator.registerLazySingleton<LoginLocal>(() => LoginLocalImpl());
  locator.registerLazySingleton<LoginRemote>(() => LoginRemoteImpl());
  locator.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());

  //Login
  locator.registerLazySingleton<AlertLocal>(() => AlertLocalImpl());
  locator.registerLazySingleton<AlertRemote>(() => AlertRemoteImpl());
  locator.registerLazySingleton<AlertRepository>(() => AlertRepositoryImpl());

  // Alert Sent feature
  locator.registerLazySingleton<AlertSentRemote>(() => AlertSentRemoteImpl());
  locator.registerLazySingleton<AlertSentLocal>(
      () => AlertSentLocalImpl(locator()));
  locator.registerLazySingleton<AlertSentRepository>(
      () => AlertSentRepositoryImpl());

  locator.registerLazySingleton<AlertDetailRemote>(() => AlertDetailRemoteImpl());
  locator.registerLazySingleton<AlertDetailRepository>(() => AlertDetailRepositoryImpl());

}
