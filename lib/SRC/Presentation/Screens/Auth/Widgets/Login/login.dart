import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';

import '../../../../../Data/DataSource/Resources/assets.dart';
import '../../../../../Data/DataSource/Resources/color.dart';
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

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.logo,
                fit: BoxFit.contain,
                height: 106,
              ),
              Text(
                "Welcome Back!",
                style: Styles.plusJakartaSans(context,
                    color: AppColors.blackColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              Text(
                "Enter your login details",
                style: Styles.plusJakartaSans(
                  context,
                  color: AppColors.grey,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 0.07.sh,
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Email';
                    }
                    return null;
                  },
                ),
              ),
              20.y,
              SizedBox(
                height: 0.07.sh,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                      icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  obscureText: _isObscured,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              5.y,
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Forgot Password ?",
                  style: Styles.plusJakartaSans(
                    context,
                    color: AppColors.blackColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              20.y,
              Button(
                svg: const SizedBox(
                  height: 100,
                  width: 70,
                ),
                textColor: AppColors.white,
                text: "Login",
                background: AppColors.primaryColor,
              ),
              20.y,
              Button(
                textColor: AppColors.blackColor,
                svg: SvgPicture.asset(
                  Assets.facebook,
                  height: 100,
                  width: 70,
                ),
                text: "Login with Facebook",
                border: Border.all(color: AppColors.grey),
              ),
              20.y,
              Button(
                textColor: AppColors.blackColor,
                svg: SvgPicture.asset(
                  Assets.google,
                  height: 100,
                  width: 70,
                ),
                text: "Login with Facebook",
                border: Border.all(color: AppColors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  Color? background;
  String text;
  Widget? svg;
  Color textColor;
  BoxBorder? border;
  Button({
    required this.textColor,
    this.svg,
    required this.text,
    this.background,
    this.border,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 0.8.sw,
          height: 0.06.sh,
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(8),
              border: border),
          child: Row(
            children: [
              svg!,
              Center(
                child: Text(
                  text,
                  style: Styles.plusJakartaSans(
                    context,
                    color: textColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }
}
