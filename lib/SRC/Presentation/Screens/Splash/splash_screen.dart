import 'dart:async';

import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/home_test.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 50), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(
                  title: 'jkdhfkshdf',
                )),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/Images/logo.webp",
          fit: BoxFit.cover,
          height: 106,
        ),
      ),
    );
  }
}
