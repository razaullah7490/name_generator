import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'SRC/Data/AppData/app_providers.dart';
import 'SRC/Presentation/Widgets/Splash/splash_screen.dart';


void main() {
  runApp(MultiBlocProvider(providers: appProviders, child: const MyApp()));

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
        return MaterialApp(
          title: 'Name Generator',
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            brightness: Brightness.light, // Set the default brightness to light
          ),

          themeMode: ThemeMode.system, // Use the system theme mode (light or dark)
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
