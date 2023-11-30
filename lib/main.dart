import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Presentation/Screens/Splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'STC HEALTH',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
