import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:name_generator/SRC/Application/Services/auth_service.dart';
import 'package:name_generator/SRC/Data/Repository/auth_repository.dart';
import 'package:name_generator/SRC/Presentation/Resources/Navigation/navigation.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Auth/Login/login_screen.dart';

import 'package:name_generator/SRC/Presentation/Widgets/Profile/cubit/profile_state.dart';
import 'package:name_generator/locator.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final authRepo = locator<AuthRepository>();
  final authService = locator<AuthService>();
  void logOut(context) async {
    emit(ProfileLoading());
    try {
      authRepo.logout();
      emit(ProfileSuccess());

  Navigate.toReplaceAll(context, LoginScreen());
    } catch (e) {
      emit(ProfileFailure('Something went wrong!'));
    }
  }
}
