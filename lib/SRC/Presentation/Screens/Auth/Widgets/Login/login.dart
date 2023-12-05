// login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';

import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Screens/Auth/Components/button.dart';
import 'package:name_generator/SRC/Presentation/Screens/Auth/Components/fields.dart';
import 'package:name_generator/SRC/Presentation/Screens/Auth/Widgets/SignUp/sign_up.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Business/business_category.dart';
import 'package:name_generator/SRC/Presentation/Screens/onboarding/onboarding_screen.dart';

import '../../../../../Data/DataSource/Resources/assets.dart';

import '../../../../../Data/DataSource/Resources/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                87.y,
                Image.asset(
                  Assets.logo,
                  fit: BoxFit.fill,
                  height: 108.h,
                ),
                10.y,
                Text(
                  "Welcome Back!",
                  style: Styles.largePlusJakartaSans(
                    context,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Enter your login details",
                  style: Styles.mediumPlusJakartaSans(
                    context,
                  ),
                  textAlign: TextAlign.center,
                ),
                20.y,
                EmailField(
                  icon: Icons.email_outlined,
                  controller: _emailController,
                  text: "Email",
                ),
                20.y,
                PasswordField(
                    controller: _passwordController, isObscured: _isObscured),
                10.y,
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Forgot Password ?",
                    style: Styles.smallPlusJakartaSans(
                      context,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                14.y,
                CustomButton(text: "Login", ontap: () {}),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 33,
                        thickness: 1,
                        color: AppColors.grey.withOpacity(0.5),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.sp),
                      child: Text(
                        "Or",
                        style: Styles.smallPlusJakartaSans(context,
                            fontSize: 11, color: AppColors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 33,
                        thickness: 1,
                        color: AppColors.grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                CustomButton(text: "Login", ontap: () {}),
                10.y,
                Button(
                  ontap: () {
                    Navigate.to(context, const BusinessCategory());
                  },
                  textColor: AppColors.blackColor,
                  svg: SvgPicture.asset(
                    Assets.google,
                    height: 100,
                    width: 70,
                  ),
                  text: "Login with Google",
                ),
                65.y,
                GestureDetector(
                  onTap: () {
                    Navigate.to(context, const SignupScreen());
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: Styles.smallPlusJakartaSans(
                        context,
                      ),
                      children: [
                        TextSpan(
                          text: 'Signup',
                          style: Styles.smallPlusJakartaSans(context,
                              color: AppColors.primaryColor.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                ),
                10.y,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
