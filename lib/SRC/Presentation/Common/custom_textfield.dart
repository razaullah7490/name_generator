import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  String text;

  Widget? prefixIcon;
  String? Function(String?)? validator;
  CustomTextField({
    super.key,
    this.validator,
    required this.controller,
    required this.text,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: text,
        hintStyle: Styles.smallPlusJakartaSans(
          context,
          fontSize: 12.sp,
          color: AppColors.grey,
        ),
        errorBorder: OutlineInputBorder(
          //  borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }
}
