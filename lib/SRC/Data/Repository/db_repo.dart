import 'package:name_generator/SRC/Application/Services/database_service.dart';
import 'package:name_generator/locator.dart';

class DatabaseRepository {
  final _dbService = locator<DatabaseService>();

  ///================= GetBanners ========================
  ///

  getBanners() async {
    return await _dbService.getBanners();
  }

  /// ================GetCaregories====================

  getCategories() async {
    return await _dbService.getCategories();
  }

  ///===========getFoems======================

  getForms() async {
    return await _dbService.getFormData();
  }

  ///===========getBooleanForm======================

  getBooleanForm() async {
    return await _dbService.getBooleanForm();
  }
}
