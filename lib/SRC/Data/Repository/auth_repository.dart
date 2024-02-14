import 'package:name_generator/SRC/Application/Services/auth_service.dart';
import 'package:name_generator/SRC/Domain/Models/app_user.dart';
import 'package:name_generator/SRC/Domain/Models/custom_auth_result.dart';
import 'package:name_generator/locator.dart';

class AuthRepository {
  CustomAuthResult customAuthResult = CustomAuthResult();
  final _authService = locator<AuthService>();

  // AppUser appUser = AppUser();

  ///[SignUp]
  ///
  Future<CustomAuthResult> signUpWithEmailPassword(AppUser appUser) async {
    return await _authService.signUpWithEmailPassword(appUser);
  }

  ///[Login]
  ///
  Future<CustomAuthResult> loginWithEmailPassword({email, password}) async {
    return await _authService.loginWithEmailPassword(
        email: email, password: password);
  }

  ///[Google]
  ///
  SignInWithGoogle() async {
    return await _authService.loginWithGoogle();
  }

///================ LogOut ===================================
///
  logout() async {
    return await _authService.logout();
  }

  

}
