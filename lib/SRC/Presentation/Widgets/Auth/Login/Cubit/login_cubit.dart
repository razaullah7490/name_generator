import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:name_generator/SRC/Application/Services/auth_service.dart';
import 'package:name_generator/SRC/Application/Services/database_service.dart';
import 'package:name_generator/SRC/Data/Repository/auth_repository.dart';
import 'package:name_generator/SRC/Domain/Models/app_user.dart';
import 'package:name_generator/SRC/Domain/Models/custom_auth_result.dart';
import 'package:name_generator/SRC/Presentation/Resources/Navigation/navigation.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Auth/Login/Cubit/login_state.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Root/root_screen.dart';
import 'package:name_generator/locator.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _dbService = locator<DatabaseService>();
    final _authRepo = locator<AuthRepository>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AppUser appUser = AppUser();
  bool isPasswordObscured = true;

  final _authService = locator<AuthService>();
  CustomAuthResult authResult = CustomAuthResult();

  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    emit(PasswordVisibilityChanged());
  }

  void loginWithEmailAndPassword(context) async {
    emit(LoginLoading());
    authResult = await _authRepo.loginWithEmailPassword(
        email: appUser.email, password: appUser.password);
    log('$authResult');
    if (authResult.status!) {
      emit(LoginSuccess());
      print("User logged in successfully");
      _authService.isLogin = true;
  
    } else {
      emit(LoginFailure('${authResult.errorMessage}'));
      log('${authResult.errorMessage}');
    }
  }

   signUpWithGoogle() async {
   emit(LoginLoading());
    authResult = await _authRepo.SignInWithGoogle();
    if (authResult.status!) {
      print("Facebook user created successfully");
      _authService.appUser =
          await _dbService.getAppUser(_authService.appUser.id);
      emit(LoginSuccess());
      Get.offAll(() => RootScreen());

    } else {
      emit(LoginFailure('error'));
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text("Sigining with Google"),
        actions: [
          ElevatedButton(child: Text("Ok"), onPressed: () => Get.back())
        ],
      ));
    }
   
  }

   signUpWithFacebook() async {
  emit(LoginLoading());
    authResult = await _authService.signupWithFacebook();
    if (authResult.status!) {
      print("Facebook user created successfully");
      _authService.appUser = await _dbService.getAppUser(authResult.user.id);
     
      Get.offAll(() => RootScreen());
      emit(LoginSuccess());
    } else {
      emit(LoginFailure('Something went wrong!'));
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text("Sigining with Facebook"),
        actions: [
          ElevatedButton(child: Text("Ok"), onPressed: () => Get.back())
        ],
      ));
    }
   
  }

}
