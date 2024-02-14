import 'package:name_generator/SRC/Application/Services/database_service.dart';
import 'package:name_generator/locator.dart';

class DatabaseRepository {
  final _dbServices = locator<DatabaseService>();

  

  ///================= GetBanners ========================
  ///

  getBanners() async {
    return await _dbServices.getBanners();
  }
}
