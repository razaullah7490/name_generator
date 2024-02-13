import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:name_generator/SRC/Application/Services/auth_service.dart';
import 'package:name_generator/SRC/Presentation/Resources/Navigation/navigation.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Auth/Login/login_screen.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Profile/cubit/profile_state.dart';
import 'package:name_generator/locator.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final authService = locator<AuthService>();

  void logOut() async {
    emit(ProfileLoading());
    try {
      authService.logout();
      emit(ProfileSuccess());

      Get.to(LoginScreen());
    } catch (e) {
      emit(ProfileFailure('Something went wrong!'));
    }
  }
}
