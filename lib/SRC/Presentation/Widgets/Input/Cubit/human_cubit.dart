
import 'package:name_generator/SRC/Data/Repository/Human/human_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'human_state.dart';

class HumanCubit extends Cubit<HumanState> {
  HumanCubit() : super(HumanInitialState());

  Future<void> getHumanName(Map<String, dynamic> data) async {
    emit(HumanLoading());
    try {
     await HumanRepository.generateHumanName(data: data).then((value) async{

      print(value['generated_name']);
      if (value['generate_name']!=null){
        emit(HumanLoadedState());
      }
     }).catchError((e){
       throw e;
     });

    } catch (e) {
      rethrow;
      // Handle errors here, for example:
      emit(HumanErrorState(errorMessage: 'An error occurred while fetching data.', error: ''));
    }
  }

  @override
  Future<void> close() {

    return super.close();
  }
}
