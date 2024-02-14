import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Application/Services/auth_service.dart';
import 'package:name_generator/SRC/Application/Services/database_service.dart';
import 'package:name_generator/SRC/Domain/Models/banners.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Home/home_screen.dart';
import 'package:name_generator/locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeInitial(),
        ) {
    getAllBanners();
  }

  List<Banners> banners = [];
  final authService = locator<AuthService>();
  final dbService = locator<DatabaseService>();

  ///==========GetBanners==============
  ///
  getAllBanners() async {
    emit(HomeLoading());
    banners = await dbService.getBanners();

    debugPrint('bannersLength => ${banners.length}');
    emit(HomeSuccess());
  }
}
