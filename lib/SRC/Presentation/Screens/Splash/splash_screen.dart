import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/BottomNavigation/Widgets/bottom_navigation.dart';

import 'package:name_generator/SRC/Presentation/Screens/onboarding/Widgets/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _initFunction();
  }

  _initFunction() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool completedOnboarding =
        prefs.getBool('completedOnboarding') ?? false;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInExpo);
    _controller.forward();

    // Navigate to another screen after the splash animation finishes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to another screen (e.g., HomeScreen)

    completedOnboarding
        ? Navigate.toReplace(context, const BottomNavigationScreen())
        : Navigate.toReplace(context, const OnboardingSreen());
      }
  });
  }
@override
  void dispose() {
    // TODO: implement dispose
  _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        
        opacity: _animation,
        child: Center(
          child: Image.asset(
            Assets.logo,
            fit: BoxFit.contain,
            height: 106,
          ),
        ),
      ),
    );
  }
}
