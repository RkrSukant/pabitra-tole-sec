import 'package:get_it/get_it.dart';
import 'package:pabitra_security/features/alert/data/alert_repository.dart';
import 'package:pabitra_security/features/alert/data/alert_repository_impl.dart';
import 'package:pabitra_security/features/alert/data/local/alert_local.dart';
import 'package:pabitra_security/features/alert/data/local/alert_local_impl.dart';
import 'package:pabitra_security/features/alert/data/remote/alert_remote.dart';
import 'package:pabitra_security/features/alert/data/remote/alert_remote_impl.dart';
import 'package:pabitra_security/features/login/data/local/login_local.dart';
import 'package:pabitra_security/features/login/data/local/login_local_impl.dart';
import 'package:pabitra_security/features/login/data/login_repository.dart';
import 'package:pabitra_security/features/login/data/login_repository_impl.dart';
import 'package:pabitra_security/features/login/data/remote/login_remote.dart';
import 'package:pabitra_security/features/login/data/remote/login_remote_impl.dart';
import 'package:pabitra_security/routes/app_route.dart';
import 'package:pabitra_security/shared/storage/shared_preferences/shared_preferences_service.dart';

final GetIt locator = GetIt.instance;

Future setUpServiceLocator() async {
  //Shared Preferences
  locator.registerSingleton(await SharedPreferencesService.getInstance());

  //Database
  // var databaseManager = await DatabaseManager.getDbInstance();
  // locator.registerLazySingleton(() => databaseManager);

  //Router
  locator.registerSingleton(AppRouter());

  //Login
  locator.registerLazySingleton<LoginLocal>(() => LoginLocalImpl());
  locator.registerLazySingleton<LoginRemote>(() => LoginRemoteImpl());
  locator.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());

  //Login
  locator.registerLazySingleton<AlertLocal>(() => AlertLocalImpl());
  locator.registerLazySingleton<AlertRemote>(() => AlertRemoteImpl());
  locator.registerLazySingleton<AlertRepository>(() => AlertRepositoryImpl());
}
