import 'package:name_generator/SRC/Data/Models/app_user.dart';
import 'package:name_generator/SRC/Data/Models/custom_auth_result.dart';

abstract class AuthRemoteDataSource {
  Future<CustomAuthResult> loginWithEmailPassword(AppUser appUser);
  Future<CustomAuthResult> signUpWithEmailPassword(AppUser appUser);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<CustomAuthResult> loginWithEmailPassword(AppUser appUser) {
    throw UnimplementedError();
  }

  @override
  Future<CustomAuthResult> signUpWithEmailPassword(AppUser appUser) {
    throw UnimplementedError();
  }
}
