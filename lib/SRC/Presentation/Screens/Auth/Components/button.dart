import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class Button extends StatelessWidget {
  String text;
  Widget? svg;
  Color textColor;

  Function() ontap;

  Button({
    required this.ontap,
    required this.textColor,
    this.svg,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          width: 0.8.sw,
          height: 0.055.sh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.grey),
          ),
          child: Row(
            children: [
              svg!,
              Center(
                child: AppText(
                  text,
                  style: Styles.mediumPlusJakartaSans(
                    context,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }
}
