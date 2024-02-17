import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Application/Services/auth_service.dart';
import 'package:name_generator/SRC/Application/Services/database_service.dart';
import 'package:name_generator/SRC/Data/Repository/auth_repository.dart';
import 'package:name_generator/SRC/Domain/Models/banners.dart';
import 'package:name_generator/SRC/Domain/Models/category.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Home/home_screen.dart';
import 'package:name_generator/locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeInitial(),
        ) {
    getAllBanners();
    getCategories();
    getBooleanForm();
  }

  List<Banners> banners = [];
  List<Categories> categories = [];
  final authService = locator<AuthService>();
  final authRepository = locator<AuthRepository>();
  final dbService = locator<DatabaseService>();
  var booleanForm = {};

  getBooleanForm() async {
    await dbService.getFormData().then((value) {
      booleanForm = value.data()!;
      print('==========================$booleanForm');
    });
  }

  ///==========GetBanners==============
  ///
  getAllBanners() async {
    emit(HomeLoading());
    banners = await dbService.getBanners();

    debugPrint('bannersLength => ${banners.length}');
    emit(HomeSuccess());
  }

  getCategories() async {
    print('helo');
    emit(HomeLoading());
    // if (dbService.categories != null) {
    categories = await authRepository.getCategories();
    print(categories.length);
    emit(HomeSuccess());
    // } else {
    //   emit(HomeFailure('No Data Found'));
    // }
  }
}
