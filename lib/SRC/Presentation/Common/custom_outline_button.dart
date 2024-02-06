import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final String? iconPath;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;

  CustomOutlinedButton({
    Key? key,
    required this.text,
     this.iconPath,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 43.0,
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton.icon(
        icon: SvgPicture.asset(
          iconPath ?? "",
          height: 25.h,
          width: 25.w,
        ),
        label: Text(
          text,
          style: Styles.smallPlusJakartaSans(context),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.withOpacity(0.5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0.r),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
