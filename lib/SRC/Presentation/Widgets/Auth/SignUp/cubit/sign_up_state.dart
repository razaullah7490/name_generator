abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure(this.error);
}

class PasswordVisibilityChanged extends SignUpState {
  final bool isObscured;

  PasswordVisibilityChanged(this.isObscured);
}
