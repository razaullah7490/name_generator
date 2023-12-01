import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

class Styles {
  static TextStyle plusJakartaSans(BuildContext context,
      {double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      double? letterSpacing}) {
    return TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: (fontSize ?? 16.0.sp),
        letterSpacing: letterSpacing ?? 0,
        color: color ?? AppColors.blackColor,
        fontFamily: "Plus Jakarta Sans",
        fontWeight: fontWeight ?? FontWeight.w400);
  }

  // static TextStyle openSansRegular(BuildContext context,
  //     {double? fontSize,
  //     Color? color,
  //     FontStyle? fontStyle,
  //     double height = 1.4,
  //     FontWeight fontWeight = FontWeight.normal,
  //     double? letterSpacing}) {
  //   return TextStyle(
  //       letterSpacing: letterSpacing ?? 0,
  //       fontSize: (fontSize ?? 14.0.sp),
  //       color: color ?? AppColors.blackColor,
  //       fontFamily: "OpenSans Regular",
  //       height: height,
  //       fontStyle: fontStyle,
  //       fontWeight: fontWeight);
  // }

  // static TextStyle openSansStdMedium(BuildContext context,
  //     {double? fontSize, Color? color}) {
  //   return TextStyle(
  //     color: color ?? AppColors.whiteColor,
  //     fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
  //     fontFamily: "OpenSans Medium",
  //   );
  // }
}
