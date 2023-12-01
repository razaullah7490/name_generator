import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Presentation/Screens/Splash/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'STC HEALTH',
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
