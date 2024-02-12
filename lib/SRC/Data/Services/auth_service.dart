import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Data/Services/auth_exception_service.dart';
import 'package:name_generator/SRC/Data/Services/database_service.dart';
import 'package:name_generator/SRC/Domain/Models/app_user.dart';
import 'package:name_generator/SRC/Domain/Models/custom_auth_result.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  final _auth = FirebaseAuth.instance;
  CustomAuthResult customAuthResult = CustomAuthResult();
  User? user;
  AppUser appUser = AppUser();
  final _dbService = DatabaseService();
  bool isLogin = false;

  /// [SignUp] with email and password function
  ///
  ///
  AuthService() {
    init();
  }
  init() async {
    user = _auth.currentUser;
    if (user != null) {
      isLogin = true;
      appUser = (await _dbService.getAppUser(user!.uid));
      if (appUser.id == null) {
        await logout();
      } else {}
    } else {
      isLogin = false;
    }
  }

  /// [SignUp] with email and password function
  ///

  Future<CustomAuthResult> signUpWithEmailPassword(AppUser appUser) async {
    debugPrint('@services/singUpWithEmailPassword');
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: appUser.email!, password: appUser.password!);

      /// If user signup fails without any exception and error code
      if (credentials.user == null) {
        customAuthResult.status = false;
        customAuthResult.errorMessage = 'An undefined Error happened.';
        return customAuthResult;
      }

      if (credentials.user != null) {
        customAuthResult.status = true;
        customAuthResult.user = credentials.user;
        appUser.id = credentials.user!.uid;

        this.appUser = appUser;

        await _dbService.registerAppUser(appUser);
      }
    } catch (e) {
      debugPrint('Exception @sighupWithEmailPassword: $e');
      customAuthResult.status = false;
      customAuthResult.errorMessage =
          AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  /// [Login] with email and password function
  ///
  Future<CustomAuthResult> loginWithEmailPassword({email, password}) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print('credentiallllssss  ...............$credentials');
      if (credentials.user == null) {
        customAuthResult.status = false;
        customAuthResult.errorMessage = 'An undefined Error happened.';
      }

      ///
      /// If firebase auth is successful:
      ///
      if (credentials.user != null) {
        this.appUser = await _dbService.getAppUser(credentials.user!.uid);

        customAuthResult.status = true;
        customAuthResult.user = credentials.user;
      }
    } catch (e) {
      customAuthResult.status = false;
      customAuthResult.errorMessage =
          AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  Future<void> logout({id}) async {
    await _auth.signOut();
    this.appUser = AppUser();
    this.isLogin = false;
    this.user = null;
  }

  ///
  /// Google SignIn
  ///

  Future<CustomAuthResult> loginWithGoogle() async {
    //Todo: Do settings in the Google cloud for 0Auth Credentials
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final authResult = await _auth.signInWithCredential(credential);
      print('register user => ${authResult.user!.uid}');

      if (authResult.user!.uid != null) {
        customAuthResult.status = true;
        appUser = AppUser();
        customAuthResult.user = authResult.user;
        appUser.id = authResult.user!.uid;
        appUser.email = authResult.user!.email;
        appUser.name = authResult.user!.displayName ?? '';
        print('Google sign in AppUser username => ${appUser.name}');
        isLogin = true;
        bool isUserExist = await _dbService.checkUser(appUser);
        if (isUserExist) {
          appUser = await _dbService.getAppUser(appUser.id);
        } else {
          await _dbService.registerAppUser(appUser);
        }

        //Todo: Create Account in Database
      } else {
        customAuthResult.status = false;
        customAuthResult.errorMessage = 'An undefined error happened.';
      }
    } catch (e) {
      print('Exception @sighupWithGoogle: $e');
      customAuthResult.status = false;
      // customAuthResult.errorMessage =
      //     AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }
}
