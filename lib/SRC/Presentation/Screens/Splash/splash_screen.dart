import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/home.dart';
import 'package:name_generator/SRC/Presentation/Screens/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initFunction();
  }

  _initFunction() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool completedOnboarding =
        prefs.getBool('completedOnboarding') ?? false;

    await Future.delayed(const Duration(seconds: 10));

    completedOnboarding
        ? Navigate.to(context, const MyHomePage())
        : Navigate.toReplace(context, const OnboardingSreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.logo,
          fit: BoxFit.contain,
          height: 106,
        ),
      ),
    );
  }
}
