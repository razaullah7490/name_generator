import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class OnboardColumnWidget extends StatelessWidget {
  String? asset;
  String text1;
  String? text2;
  String? text4;
  String text3;

  TextSpan? span;

  OnboardColumnWidget({
    this.asset,
    this.span,
    required this.text1,
    this.text2,
    this.text4,
    required this.text3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          25.y,
          Image.asset(
            asset!,
            scale: 4.0,
            //fit: BoxFit.cover,
          ),
          20.y,
          Column(
            children: [
              AppText(
                text1,
                style: Styles.largePlusJakartaSans(context, fontSize: 25.sp),
                textAlign: TextAlign.center,
              ),
              5.y,
              AppText(
                "Simpllify the process of finding the perfect\nand professional name",
                style: Styles.mediumPlusJakartaSans(context, fontSize: 15.sp),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
