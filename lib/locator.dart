

import 'package:get_it/get_it.dart';
import 'package:name_generator/SRC/Data/Services/auth_service.dart';
import 'package:name_generator/SRC/Data/Services/database_service.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());

  locator.registerSingleton(AuthService());
}
 