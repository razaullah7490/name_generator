import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Root/root_screen.dart';
import '../Onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
   Animation<double>? _animation;
   bool? completedOnboarding=false;
 _initFunction() async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
completedOnboarding = prefs.getBool('completedOnboarding') ?? false;
   // return completedOnboarding;
  }
  @override
  void initState() {
    // _initFunction();


  // final bool completedOnboarding=_initFunction();

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

        completedOnboarding!
            ? Navigate.toReplace(context, const RootScreen())
            : Navigate.toReplace(context, const OnboardingSreen());
      }
    });
    super.initState();


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
        
        opacity: _animation!,
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
