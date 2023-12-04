import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Screens/Dashboard/BottomNavigation/bottom_navigation.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/home.dart';

// import 'SRC/Presentation/Screens/Home/home_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return 
    

     ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Name Generator',
            theme: ThemeData(primaryColor: AppColors.primaryColor),
            //home: const LoginScreen(),
            home: BottomNavigationScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
    
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Name Generator',
    //   theme: ThemeData(
         
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const MyHomePage(),
    // );
  }
}
