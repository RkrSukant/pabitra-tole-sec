import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sukant_flutter_boilerplate/features/example/data/example_repository.dart';
import 'package:sukant_flutter_boilerplate/features/example/data/example_repository_impl.dart';
import 'package:sukant_flutter_boilerplate/features/example/data/local/example_local.dart';
import 'package:sukant_flutter_boilerplate/features/example/data/local/example_local_impl.dart';
import 'package:sukant_flutter_boilerplate/features/example/data/remote/example_remote.dart';
import 'package:sukant_flutter_boilerplate/features/example/data/remote/example_remote_impl.dart';
import 'package:sukant_flutter_boilerplate/routes/app_route.dart';
import 'package:sukant_flutter_boilerplate/shared/network/rest/rest_service_impl.dart';
import 'package:sukant_flutter_boilerplate/shared/storage/shared_preferences/shared_preferences_service.dart';
import 'package:sukant_flutter_boilerplate/shared/storage/sqlite/db_manager.dart';

final GetIt locator = GetIt.instance;

Future setUpServiceLocator() async {
  //Shared Preferences
  SharedPreferencesService sharedPrefService =
      await SharedPreferencesService.getInstance();
  locator.registerSingleton(sharedPrefService);

  //Database
  var databaseManager = await DatabaseManager.getDbInstance();
  locator.registerLazySingleton(() => databaseManager);

  //Router
  locator.registerSingleton(AppRouter());

  //Dio
  locator.registerLazySingleton(
    () {
      final Dio dio = Dio();
      return DioNetworkService(dio);
    },
  );

  //example
  locator.registerLazySingleton<ExampleLocal>(() => ExampleLocalImpl());
  locator.registerLazySingleton<ExampleRemote>(() => ExampleRemoteImpl());
  locator
      .registerLazySingleton<ExampleRepository>(() => ExampleRepositoryImpl());
}
