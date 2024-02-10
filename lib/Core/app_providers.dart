import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:name_generator/SRC/Presentation/Widgets/Auth/Login/Cubit/login_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Auth/SignUp/cubit/sign_up_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Input/Cubit/human_cubit.dart';

List<BlocProvider> appProviders = [
  BlocProvider<HumanCubit>(create: (context) => HumanCubit()),
  // BlocProvider(
  //   create: (context) => LoginCubit(),
  // ),
  // BlocProvider(
  //   create: (context) => SignUpCubit(),
  // ),
];
