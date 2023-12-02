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

import '../../../../../Data/DataSource/Resources/assets.dart';

import '../../../../../Data/DataSource/Resources/styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
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
                77.y,
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
                  "Enter your SignUp details",
                  style: Styles.mediumPlusJakartaSans(
                    context,
                  ),
                  textAlign: TextAlign.center,
                ),
                20.y,
                EmailField(
                  icon: Icons.person_outline,
                  controller: _nameController,
                  text: 'name',
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
                24.y,
                Button(
                  ontap: () {},
                  svg: SizedBox(
                    height: 100,
                    width: 0.35.sw,
                  ),
                  textColor: AppColors.white,
                  text: "SignUp",
                  background: AppColors.primaryColor,
                ),
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
                Button(
                  ontap: () {},
                  textColor: AppColors.blackColor,
                  svg: SvgPicture.asset(
                    Assets.facebook,
                    height: 100,
                    width: 70,
                  ),
                  text: "Login with Facebook",
                  border: Border.all(color: AppColors.grey),
                ),
                10.y,
                Button(
                  ontap: () {},
                  textColor: AppColors.blackColor,
                  svg: SvgPicture.asset(
                    Assets.google,
                    height: 100,
                    width: 70,
                  ),
                  text: "Login with Facebook",
                  border: Border.all(color: AppColors.grey),
                ),
                40.y,
                GestureDetector(
                  onTap: () {
                    Navigate.pop(context);
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: Styles.smallPlusJakartaSans(
                        context,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: Styles.smallPlusJakartaSans(context,
                              color: AppColors.primaryColor.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                ),
                15.y,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
