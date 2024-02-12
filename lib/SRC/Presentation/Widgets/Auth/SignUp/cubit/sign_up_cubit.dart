import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_generator/SRC/Data/Services/auth_service.dart';
import 'package:name_generator/SRC/Domain/Models/app_user.dart';
import 'package:name_generator/SRC/Domain/Models/custom_auth_result.dart';
import 'package:name_generator/SRC/Presentation/Resources/Navigation/navigation.dart';

import 'package:name_generator/SRC/Presentation/Widgets/Auth/SignUp/cubit/sign_up_state.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Root/root_screen.dart';
import 'package:name_generator/locator.dart';

class SignUpCubit extends Cubit<SignUpState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AppUser appUser = AppUser();
  CustomAuthResult authResult = CustomAuthResult();
  AuthService _authService = locator<AuthService>();
  bool isPasswordObscured = true;
  SignUpCubit() : super(SignUpInitial());

  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    emit(PasswordVisibilityChanged(isPasswordObscured));
  }

  void signUpWithEmailAndPassword(context) async {
    emit(SignUpLoading());

    authResult = await _authService.signUpWithEmailPassword(appUser);
    log('$authResult');
    if (authResult.status!) {
      print("User logged in successfully");
      _authService.isLogin = true;

      emit(SignUpSuccess());
     
    } else {
      emit(SignUpFailure(authResult.errorMessage!));
    
    }
   
  }
}
