import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_generator/SRC/Presentation/Screens/Auth/Login/Cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  bool _isPasswordObscured = true;
  LoginCubit() : super(LoginInitial());

  
 void togglePasswordVisibility() {
    _isPasswordObscured = !_isPasswordObscured;
    emit(PasswordVisibilityChanged(_isPasswordObscured));
  }
  
}


