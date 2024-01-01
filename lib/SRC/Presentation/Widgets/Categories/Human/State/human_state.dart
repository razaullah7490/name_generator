
import 'dart:convert';
import '../../../../../Domain/human_model.dart';

abstract class HumanState {}

class HumanInitialState extends HumanState {}

class HumanLoadedState extends HumanState {
  // final Human humanModelData;
  // late final Map<String, dynamic> humanName;
  // HumanLoadedState({required this.humanModelData}) {
  //   final String jsonString = json.encode(humanModelData);
  //   humanName = json.decode(jsonString);
  }

class HumanLoading extends HumanState {
  HumanLoading();
}

class HumanErrorState extends HumanState {
  final String error;

  HumanErrorState({required this.error, required String errorMessage});
}











//
//
//
// import 'dart:convert';
//
// import '../../../../../Domain/human_model.dart';
//
// abstract class HumanState {}
//
// class HumanInitialState extends HumanState {}
//
//
// class HumanLoadedState extends HumanState {
//
// final Human humanloadeddata;
//
// Map <String,dynamic> converted = json.decode(Human);
// HumanLoadedState({required this.humanloadeddata});
//
//
// }
//
// class HumanLoading extends HumanState{
//   HumanLoading();
// }
//
// class HumanErrorState extends HumanState {
//   final String error;
//
//   HumanErrorState({required this.error});
// }
