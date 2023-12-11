import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Screens/Auth/Widgets/Login/login.dart';

import 'package:name_generator/SRC/Presentation/Screens/onboarding/Components/onboard_column_widget.dart';

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
      await prefs.setBool(AppStrings.completedOnboarding, true);

      Navigate.toReplace(context, const LoginScreen());
    }
  }

  void _skipPage() async {
    if (_currentPage < 2) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppStrings.completedOnboarding, false);
      Navigate.toReplace(context, const LoginScreen());
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppStrings.completedOnboarding, true);
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.y,
              Expanded(
                child: PageView(
                  padEnds: false,
                  controller: _pageController,
                  onPageChanged: _updatePage,
                  children: [
                    OnboardColumnWidget(
                      asset: Assets.onboardImg,
                      text1: AppStrings.oneStop,
                      span: const TextSpan(text: "\n"),
                      text2: AppStrings.processFinding,
                      text3: "",
                      text4: "",
                    ),
                    OnboardColumnWidget(
                      asset: Assets.onboardImg,
                      text1: AppStrings.discover,
                      span: const TextSpan(text: "\n"),
                      text2: AppStrings.genarateNamePreferences,
                      text3: "",
                      text4: " ",
                    ),
                    OnboardColumnWidget(
                      asset: Assets.thirdOnboard,
                      text1: AppStrings.aiPowered,
                      span: const TextSpan(text: "\n"),
                      text2: AppStrings.category,
                      text3: AppStrings.subCategory,
                      text4: AppStrings.generateName,
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
              2.y,
              CustomButton(
                iconData: const SizedBox(),
                text: _currentPage < 2 ? AppStrings.next : AppStrings.started,
                ontap: _currentPage < 2 ? _nextPage : _skipPage,
              ),
              24.y,
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  String text;
  Function() ontap;
  Widget? iconData;

  CustomButton({
    super.key,
    required this.text,
    required this.ontap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.8.sw,
      height: 0.07.sh,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text,
                style: const TextStyle(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
              iconData!
            ],
          ),
        ),
      ),
    );
  }
}
