import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Common/app_shadow.dart';

class RoundAvatar extends StatelessWidget {
  final double? padding;
  final double? imagewidth;
  final double? imageheight;
  final bool? haveborder;
  final bool? issvg;

  const RoundAvatar({
    this.haveborder,
    this.issvg,
    this.imageheight,
    this.imagewidth,
    this.padding,
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.all(padding ?? 0.r),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            AppShadow.minimum(),
          ],
          border: haveborder == true
              ? Border.all(color: const Color(0xffDBE7F5))
              : Border.all(color: AppColors.white)),
      child: issvg == true
          ? SvgPicture.asset(
              icon,
              width: imagewidth ?? 20.w,
              height: imageheight ?? 20.h,
            )
          : Image.asset(
              icon,
              width: imagewidth,
              height: imageheight,
            ),
    );
  }
}
