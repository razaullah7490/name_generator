// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';

import 'package:name_generator/SRC/Application/Services/database_service.dart';
import 'package:name_generator/SRC/Data/Repository/auth_repository.dart';
import 'package:name_generator/SRC/Data/Repository/db_repo.dart';
import 'package:name_generator/SRC/Domain/Models/boolean_form.dart';
import 'package:name_generator/SRC/Domain/Models/form_data.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Form/cubit/form_state.dart';
import 'package:name_generator/locator.dart';

class FormCubit extends Cubit<FormmState> {
  String catgoryId;
  FormCubit(
    this.catgoryId,
  ) : super(FormInitial( )) {

    retrieveBooleanForm();
    retrieveFormData();
  }

  FormsDataa? formData = FormsDataa();
  BooleanForm? booleanForm = BooleanForm();
  final authRepository = locator<AuthRepository>();
  final dbService = locator<DatabaseService>();
  final dbRepo = locator<DatabaseRepository>();

  void retrieveBooleanForm() async {
    try {
      emit(FormLoading());
      booleanForm = await dbRepo.getBooleanForm(categoryId: catgoryId);
      print(booleanForm?.charType ?? 'kkkk');
      emit(FormSuccess());
      if (booleanForm != null) {
        print("Retrieved data: ${booleanForm!.toJson()}");
      }
    } catch (e) {
      debugPrint('Error while getting booleanForm $e');
      emit(FormFailure('Something went wrong'));
    }
  }

  void retrieveFormData() async {
    try {
      emit(FormLoading());
      formData = await dbRepo.getForms();
      print(formData?.cookingStyle ?? 'kkkk');
      emit(FormSuccess());
      if (formData != null) {
        print("Retrieved data: ${formData!.toJson()}");
      }
    } catch (e) {
      debugPrint('Error while getting booleanForm $e');
      emit(FormFailure('Something went wrong'));
    }
  }
}
