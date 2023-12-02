import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
<<<<<<< HEAD
import 'package:name_generator/SRC/Presentation/Screens/Auth/Widgets/Login/login.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/home_test.dart';
=======
import 'package:name_generator/SRC/Presentation/Screens/Home/home.dart';
>>>>>>> 1901a2184a45f43d6ae674cab90324500387026c
import 'package:name_generator/SRC/Presentation/Screens/onboarding/onboard_column_widget.dart';

import 'package:shared_preferences/shared_preferences.dart';

class OnboardingSreen extends StatefulWidget {
  const OnboardingSreen({super.key});

  @override
  State<OnboardingSreen> createState() => _OnboardingSreenState();
}

class _OnboardingSreenState extends State<OnboardingSreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _updatePage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() async {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('completedOnboarding', true);

      Navigate.toReplace(context, const LoginScreen());
    }
  }

  void _skipPage() async {
    if (_currentPage < 2) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('completedOnboarding', false);
      Navigate.toReplace(context, const LoginScreen());
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('completedOnboarding', true);
      // ignore: use_build_context_synchronously
      Navigate.toReplace(context, const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1.sh,
          color: Colors.white,
          child: Column(
            children: [
              60.y,
              Expanded(
                child: PageView(
                  padEnds: false,
                  controller: _pageController,
                  onPageChanged: _updatePage,
                  children: [
                    OnboardColumnWidget(
                      asset: Assets.onboardImg,
                      text1: "Your One-Stop Name Solution",
                      span: const TextSpan(text: "\n"),
                      text2:
                          "Simplify the process of finding the perfect and professional name.",
                      text3: "",
                      text4: "",
                    ),
                    OnboardColumnWidget(
                      asset: Assets.onboardImg,
                      text1: "Customize or Discover Names",
                      span: const TextSpan(text: "\n"),
                      text2:
                          "Generate names tailored to your preferences or explore rand suggestions.",
                      text3: "",
                      text4: " ",
                    ),
                    OnboardColumnWidget(
                      asset: Assets.thirdOnboard,
                      text1: "AI-Powered Name Generation Process",
                      span: const TextSpan(text: "\n"),
                      text2: "• Choose a Category",
                      text3: "• Choose a Subcategory",
                      text4: "• Generate Names",
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      margin: const EdgeInsets.all(2),
                      width: _currentPage == i ? 30.0 : 10.0,
                      height: 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: _currentPage == i
                              ? AppColors.primaryColor
                              : Colors.grey),
                    ),
                ],
              ),
              6.y,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 0.8.sw,
                    height: 0.07.sh,
                    child: ElevatedButton(
                      onPressed: _currentPage < 2 ? _nextPage : _skipPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        _currentPage < 2 ? "Next" : "Get Started",
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
              24.y,
            ],
          ),
        ),
      ),
    );
  }
}
