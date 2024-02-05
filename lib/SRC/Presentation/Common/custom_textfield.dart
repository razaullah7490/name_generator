import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  String text;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool obscureText;
  String? Function(String?)? validator;
  CustomTextField({
    super.key,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    required this.controller,
    required this.text,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: text,
        hintStyle: Styles.smallPlusJakartaSans(
          context,
          fontSize: 12.sp,
          color: AppColors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      validator: validator,
    );
  }
}
