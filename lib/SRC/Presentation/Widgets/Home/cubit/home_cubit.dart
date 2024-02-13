import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:name_generator/SRC/Application/Services/auth_service.dart';
import 'package:name_generator/locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
    final authService = locator<AuthService>();
}
