import 'package:flutter/material.dart';

abstract class FormmState {}

class FormInitial extends FormmState {}

class FormLoading extends FormmState {}

class FormSuccess extends FormmState {}

class FormFailure extends FormmState {
  final String error;

  FormFailure(this.error);
}

class radiobuttonState extends FormmState {}

class DatePickerState extends FormmState {
  final DateTime? selectedDate;

  DatePickerState(this.selectedDate);
}
