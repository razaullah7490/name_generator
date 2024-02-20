

abstract class FormmState {}

class FormInitial extends FormmState {}

class FormLoading extends FormmState {}

class FormSuccess extends FormmState {}

class FormFailure extends FormmState {
  final String error;

  FormFailure(this.error);
}
