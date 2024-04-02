import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Application/Services/auth_service.dart';
import 'package:name_generator/SRC/Application/Services/database_service.dart';
import 'package:name_generator/SRC/Data/Repository/auth_repository.dart';
import 'package:name_generator/SRC/Data/Repository/db_repo.dart';
import 'package:name_generator/SRC/Domain/Models/banners.dart';
import 'package:name_generator/SRC/Domain/Models/blog.dart';
import 'package:name_generator/SRC/Domain/Models/boolean_form.dart';
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
    //  retrieveData();
  }

  List<Banners> banners = [];
  List<Categories> categories = [];
  final authService = locator<AuthService>();
  final authRepository = locator<AuthRepository>();
  final dbService = locator<DatabaseService>();
  final dbRepo = locator<DatabaseRepository>();

  List<Blog> blog = [];
  BooleanForm? boolForm;

  // getForms() async {
  //   blog = await dbRepo.getForms();
  //   print(blog[0].targetAudience);
  // }

  // void retrieveData() async {
  //   BooleanForm? booleanForm = await dbRepo.getBooleanForm();
  //   print(booleanForm?.charType ?? 'kkkk');

  //   if (booleanForm != null) {

  //     print("Retrieved data: ${booleanForm.toJson()}");
  //   }
  // }

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
    categories = await dbRepo.getCategories();
    print(categories.length);
    emit(HomeSuccess());
    // } else {
    //   emit(HomeFailure('No Data Found'));
    // }
  }
}
