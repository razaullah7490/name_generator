import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color.dart';
  


class Styles {
  static TextStyle plusJakartaRegular(BuildContext context,
      {double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      double? letterSpacing}) {
    return TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: (fontSize ?? 16.0.sp),
        letterSpacing: letterSpacing ?? 0,
        color: color ?? AppColors.blackColor,
        fontFamily: "Plus Jakarta Sans",
        fontWeight: fontWeight ?? FontWeight.w400);
  }

  static TextStyle plusJakartaBold(BuildContext context,
      {double? fontSize,
      Color? color,
      FontStyle? fontStyle,
      double height = 1.4,
      FontWeight fontWeight = FontWeight.bold,
      double? letterSpacing}) {
    return TextStyle(
        letterSpacing: letterSpacing ?? 0,
        fontSize: (fontSize ?? 14.0.sp),
        color: color ?? AppColors.blackColor,
        fontFamily: "plus jakarta bold",
        height: height,
        fontStyle: fontStyle,
        fontWeight: fontWeight);
  }


  static TextStyle plusJakartaMedium(BuildContext context,
      {double? fontSize,
        Color? color,
        FontStyle? fontStyle,
        double height = 1.4,
        FontWeight fontWeight = FontWeight.bold,
        double? letterSpacing}) {
    return TextStyle(
        letterSpacing: letterSpacing ?? 0,
        fontSize: (fontSize ?? 14.0.sp),
        color: color ?? AppColors.blackColor,
        fontFamily: "plus jakarta medium",
        height: height,
        fontStyle: fontStyle,
        fontWeight: fontWeight);
  }




}
