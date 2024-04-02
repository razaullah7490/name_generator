import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:name_generator/SRC/Presentation/Widgets/Auth/Login/Cubit/login_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Auth/SignUp/cubit/sign_up_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Form/cubit/form_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Home/cubit/home_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Input/Cubit/human_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Profile/cubit/profile_cubit.dart';

List<BlocProvider> appProviders = [
  BlocProvider<HumanCubit>(create: (context) => HumanCubit()),
  BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
  BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
  // BlocProvider<FormCubit>(create: (context) => FormCubit()),
  // BlocProvider(
  //   create: (context) => LoginCubit(),
  // ),
  // BlocProvider(
  //   create: (context) => SignUpCubit(),
  // ),
];
