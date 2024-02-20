import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Application/Services/database_service.dart';
import 'package:name_generator/SRC/Data/Repository/auth_repository.dart';
import 'package:name_generator/SRC/Data/Repository/db_repo.dart';
import 'package:name_generator/SRC/Domain/Models/boolean_form.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Form/cubit/form_state.dart';
import 'package:name_generator/locator.dart';



class FormCubit extends Cubit<FormmState> {
  FormCubit() : super(FormInitial()) {
    retrieveBooleanForm();
  }
 late  BooleanForm booleanForm;
  final authRepository = locator<AuthRepository>();
  final dbService = locator<DatabaseService>();
  final dbRepo = locator<DatabaseRepository>();

  void retrieveBooleanForm() async {
    try {
      emit(FormLoading());
      booleanForm = await dbRepo.getBooleanForm();
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
}
