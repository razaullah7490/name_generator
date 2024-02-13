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
    await _authService.signUpWithEmailPassword(appUser);
    return customAuthResult;
  }

  ///[Login]
  ///
  loginWithEmailPassword({email, password}) async {
    await _authService.loginWithEmailPassword();
  }

  ///[Google]
  ///
  SignInWithGoogle() async {
    await _authService.loginWithGoogle();
  }
}
