import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/validator.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_button.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_outline_button.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_textfield.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Auth/Login/Cubit/login_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Auth/Login/Cubit/login_state.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Auth/SignUp/sign_up.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Dashboard/Root/root_screen.dart';

import '../../../../Application/Services/Navigation/navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
            return Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      55.y,

                      ///logo and text ... header
                      ///
                      ///
                      logoAndText(),
                      20.y,

                      ///
                      ///Text Fields
                      ///
                      CustomTextField(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 20.h,
                          color: Colors.grey,
                        ),
                        controller: cubit.emailController,
                        text: 'Enter Email',
                        validator: Validate.emailValidation,
                      ),
                      20.y,
                      CustomTextField(
                        obscureText: cubit.isPasswordObscured,
                        suffixIcon: IconButton(
                          onPressed: () {
                            context
                                .read<LoginCubit>()
                                .togglePasswordVisibility();
                          },
                          icon: Icon(cubit.isPasswordObscured
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: AppColors.grey,
                        ),
                        prefixIcon: Image.asset(
                          '${staticAssets}lock-closed-outline.png',
                          scale: 4.0,
                        ),
                        controller: cubit.passwordController,
                        text: 'Enter Password',
                        validator: Validate.password,
                      ),

                      ///

                      ///Forgot Button
                      ///
                      10.y,
                      Align(
                        alignment: Alignment.bottomRight,
                        child: AppText(
                          AppStrings.forgot,
                          style: Styles.smallPlusJakartaSans(context,
                              fontSize: 12.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      14.y,

                      ///
                      ///login
                      ///
                      CustomButton(
                          iconData: const SizedBox(),
                          text: 'Login',
                          ontap: () {
                            Navigate.toReplace(context, const RootScreen());
                          }),
                      4.y,

                      ///
                      ///
                      orAndDivider(),
                      10.y,

                      ///
                      ///social logins
                      ///
                      CustomOutlinedButton(
                        text: 'Login with Facebook',
                        iconPath: Assets.facebook,
                        onPressed: () {},
                      ),

                      15.y,

                      CustomOutlinedButton(
                        text: 'Login with Google',
                        iconPath: Assets.google,
                        onPressed: () {},
                      ),

                      70.y,

                      ///
                      ///don't have an account
                      ///
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
                                    fontSize: 15.sp,
                                    color: AppColors.primaryColor),
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
            );
          },
        ),
      ),
    );
  }

  orAndDivider() {
    return Row(
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
    );
  }

  logoAndText() {
    return Column(
      children: [
        Image.asset(
          Assets.logo,
          fit: BoxFit.fill,
          scale: 3,
        ),
        10.y,
        AppText(
          AppStrings.wellcome,
          style: Styles.largePlusJakartaSans(context, fontSize: 24.sp),
          textAlign: TextAlign.center,
        ),
        AppText(
          AppStrings.enterLogin,
          style: Styles.mediumPlusJakartaSans(context,
              fontSize: 14.sp, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
