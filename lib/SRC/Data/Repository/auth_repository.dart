import 'package:name_generator/SRC/Data/Services/auth_service.dart';
import 'package:name_generator/SRC/Domain/Models/app_user.dart';
import 'package:name_generator/locator.dart';

class AuthRepository {
  final _authService = locator<AuthService>();

  AppUser appUser = AppUser();

  ///[SignUp]
  ///
  signUpWithEmailPassword() async {
    await _authService.signUpWithEmailPassword(appUser);
  }

  ///[Login]
  ///
  loginWithEmailPassword() async {
    await _authService.loginWithEmailPassword();
  }

  ///[Google]
  ///
  SignInWithGoogle() async {
    await _authService.loginWithGoogle();
  }
}
