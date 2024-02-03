import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Screens/Auth/Login/cubit/login_cubit.dart';
import 'package:name_generator/SRC/Presentation/Screens/Auth/SignUp/cubit/sign_up_cubit.dart';
import 'package:name_generator/SRC/Presentation/Screens/Splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LoginCubit(),
              ),
              BlocProvider(
                create: (context) => SignUpCubit(),
              ),
            ],
            child: MaterialApp(
              title: 'Name Generator',
              theme: ThemeData(primaryColor: AppColors.primaryColor),
              home: const SplashScreen(),
              debugShowCheckedModeBanner: false,
            ),
          );
        });
  }
}
