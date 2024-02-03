import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_generator/SRC/Presentation/Screens/Auth/SignUp/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPasswordObscured = true;
  SignUpCubit() : super(SignUpInitial());

  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    emit(PasswordVisibilityChanged(isPasswordObscured));
  }
}
