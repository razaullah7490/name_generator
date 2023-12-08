import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';

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
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: haveborder == true
              ? Border.all(color: const Color(0xffDBE7F5))
              : Border.all(color: AppColors.white)),
      child: issvg == true
          ? SvgPicture.asset(
              icon,
              width: imagewidth!,
              height: imageheight!,
            )
          : Image.asset(
              icon,
              width: imagewidth,
              height: imageheight,
            ),
    );
  }
}
