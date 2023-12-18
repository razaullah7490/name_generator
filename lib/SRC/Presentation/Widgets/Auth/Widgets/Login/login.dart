// login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_button.dart';
import '../../../../../Data/DataSource/Resources/assets.dart';
import '../../../../../Data/DataSource/Resources/styles.dart';
import '../../../Dashboard/BottomNavigation/Widgets/bottom_navigation.dart';
import '../../Components/button.dart';
import '../../Components/fields.dart';
import '../SignUp/sign_up.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                87.y,
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
                  AppStrings.enterLogin,
                  style: Styles.mediumPlusJakartaSans(
                    context,
                  ),
                  textAlign: TextAlign.center,
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
                10.y,
                Align(
                  alignment: Alignment.bottomRight,
                  child: AppText(
                    AppStrings.forgot,
                    style: Styles.smallPlusJakartaSans(
                      context,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                14.y,
                CustomButton(
                    iconData: const SizedBox(),
                    text: AppStrings.login,
                    ontap: () {
                      Navigate.toReplace(
                          context, const BottomNavigationScreen());
                    }),
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
                    height: 100,
                    width: 70,
                  ),
                  text: AppStrings.facebook,
                ),
                10.y,
                Button(
                  ontap: () {
                    Navigate.to(context, const BottomNavigationScreen());
                  },
                  textColor: AppColors.blackColor,
                  svg: SvgPicture.asset(
                    Assets.google,
                    height: 100,
                    width: 70,
                  ),
                  text: AppStrings.google,
                ),
                65.y,
                GestureDetector(
                  onTap: () {
                    Navigate.to(context, const SignupScreen());
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: AppStrings.dontAccount,
                      style: Styles.smallPlusJakartaSans(
                        context,
                      ),
                      children: [
                        TextSpan(
                          text: AppStrings.signup,
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
