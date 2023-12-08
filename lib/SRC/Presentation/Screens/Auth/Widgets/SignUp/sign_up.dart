// login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';

import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Screens/Auth/Components/button.dart';
import 'package:name_generator/SRC/Presentation/Screens/Auth/Components/fields.dart';
import 'package:name_generator/SRC/Presentation/Screens/onboarding/Widgets/onboarding_screen.dart';

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
                AppText(
                  AppStrings.wellcome,
                  style: Styles.largePlusJakartaSans(
                    context,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppText(
                  AppStrings.enterSignup,
                  style: Styles.mediumPlusJakartaSans(
                    context,
                  ),
                  textAlign: TextAlign.center,
                ),
                20.y,
                EmailField(
                  icon: Icons.person_outline,
                  controller: _nameController,
                  text: AppStrings.name,
                ),
                20.y,
                EmailField(
                  icon: Icons.email_outlined,
                  controller: _emailController,
                  text: AppStrings.email,
                ),
                20.y,
                PasswordField(
                    controller: _passwordController, isObscured: _isObscured),
                24.y,
                CustomButton(
                  text: AppStrings.signup,
                  ontap: () {},
                  iconData: const SizedBox(),
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
                      child: AppText(
                        AppStrings.or,
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
                    height: 70,
                    width: 70,
                  ),
                  text: AppStrings.facebook,
                ),
                10.y,
                Button(
                  ontap: () {},
                  textColor: AppColors.blackColor,
                  svg: SvgPicture.asset(
                    Assets.google,
                    height: 70,
                    width: 70,
                  ),
                  text: AppStrings.google,
                ),
                40.y,
                GestureDetector(
                  onTap: () {
                    Navigate.pop(context);
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: AppStrings.alreadyAccount,
                      style: Styles.smallPlusJakartaSans(
                        context,
                      ),
                      children: [
                        TextSpan(
                          text: AppStrings.login,
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
