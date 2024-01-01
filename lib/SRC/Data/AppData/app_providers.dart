
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_generator/SRC/Domain/human_model.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Categories/Human/Controller/human_cubit.dart';

List<BlocProvider> appProviders = [

BlocProvider<HumanCubit>(create: (context) => HumanCubit()),

];


