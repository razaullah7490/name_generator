

import 'package:get_it/get_it.dart';
import 'package:name_generator/SRC/Application/Services/auth_service.dart';
import 'package:name_generator/SRC/Application/Services/database_service.dart';
import 'package:name_generator/SRC/Data/Repository/auth_repository.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());

  locator.registerSingleton(AuthService());
   locator.registerSingleton(AuthRepository());
}
 