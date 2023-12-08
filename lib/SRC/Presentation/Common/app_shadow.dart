import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';

class AppShadow {
  static BoxShadow normal() => const BoxShadow(
        color: Color(0x0F000000),
        blurRadius: 12,
        offset: Offset(0, 6),
        spreadRadius: 0,
      );

  static BoxShadow minimum() => BoxShadow(
        blurRadius: 7,
        spreadRadius: 2,
        color: AppColors.lightgrey.withOpacity(0.1),
        offset: const Offset(0, 3),
      );
}
