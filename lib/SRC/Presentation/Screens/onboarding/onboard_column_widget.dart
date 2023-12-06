import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';

import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';

// ignore: must_be_immutable
class OnboardColumnWidget extends StatelessWidget {
  String? asset;
  String text1;
  String? text2;
  String? text4;

  String text3;
  Widget? container;
  TextSpan? span;

  OnboardColumnWidget({
    this.asset,
    this.span,
    required this.text1,
    this.text2,
    this.text4,
    this.container,
    required this.text3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            asset!,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Text(
                text1,
                style: Styles.largePlusJakartaSans(
                  context,
                ),
                textAlign: TextAlign.center,
              ),
              5.y,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: container,
                  ),
                  Expanded(
                    child: Text(
                      "$text2\n$text3\n$text4",
                      style: Styles.mediumPlusJakartaSans(
                        context,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
