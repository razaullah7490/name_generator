import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';

InputDecoration decoration(BuildContext context, String text) {
  return InputDecoration(
    prefixIcon: const Icon(
      Icons.email_outlined,
      color: AppColors.grey,
    ),
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(10)),
    labelText: text,
    labelStyle: Styles.smallPlusJakartaSans(
      context,
      color: AppColors.grey,
    ),
  );
}
