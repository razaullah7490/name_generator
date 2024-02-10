
import 'package:name_generator/SRC/Domain/Entities/user_entity.dart';

abstract class AuthRepository {

   Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity user);

  // Future<bool> loginWithEmail(String email, String password);
  // Future<bool> signUpWithEmail(String email, String password);
  // Future<bool> confirmSignUp(String email, String code);
  // Future<bool> loginWithFacebook();
  // Future<bool> loginWithGoogle();
  // // Future<AuthSession> getCurrentAuthSession();
  // // Future<AuthUser> getCurrentAuthUser();
  // Future<void> logOut();

}

