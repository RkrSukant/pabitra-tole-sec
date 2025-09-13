import 'package:get_it/get_it.dart';
import 'package:pabitra_security/routes/app_route.dart';
import 'package:pabitra_security/shared/storage/shared_preferences/shared_preferences_service.dart';

final GetIt locator = GetIt.instance;

Future setUpServiceLocator() async {
  //Shared Preferences
  SharedPreferencesService sharedPrefService =
      await SharedPreferencesService.getInstance();
  locator.registerSingleton(sharedPrefService);

  //Database
  // var databaseManager = await DatabaseManager.getDbInstance();
  // locator.registerLazySingleton(() => databaseManager);

  //Router
  locator.registerSingleton(AppRouter());

  //Dio
  // locator.registerLazySingleton(
  //   () {
  //     final Dio dio = Dio();
  //     return DioNetworkService(dio);
  //   },
  // );

  //example
  // locator.registerLazySingleton<ExampleLocal>(() => ExampleLocalImpl());
  // locator.registerLazySingleton<ExampleRemote>(() => ExampleRemoteImpl());
  // locator
  //     .registerLazySingleton<ExampleRepository>(() => ExampleRepositoryImpl());
}
