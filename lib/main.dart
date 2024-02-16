import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:name_generator/SRC/Application/Services/database_service.dart';
import 'package:name_generator/SRC/Domain/Models/category.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/locator.dart';
import 'SRC/Presentation/Resources/app_providers.dart';
import 'SRC/Presentation/Widgets/Splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyBVeMW8zlHpaRL70B0Wy3KG3NeKyOqlays",
    appId: "1:608984517534:android:b32aa954d3ae1d0601648f",
    messagingSenderId: "608984517534",
    projectId: "name-generator-1ca2e",
  ));

  await setupLocator();

  // final _db = locator<DatabaseService>();
  // await _db.getCategories();
  // Categories cat = Categories();
  // await _db.getFormData(_db.categories![0].id ?? "");

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
        return GetMaterialApp(
          title: 'Name Generator',
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            brightness: Brightness.light, // Set the default brightness to light
          ),

          themeMode:
              ThemeMode.system, // Use the system theme mode (light or dark)
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
