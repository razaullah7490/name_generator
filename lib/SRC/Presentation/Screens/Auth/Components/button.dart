import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';

class Button extends StatelessWidget {
  Color? background;
  String text;
  Widget? svg;
  Color textColor;
  BoxBorder? border;

  Function() ontap;

  Button({
    required this.ontap,
    required this.textColor,
    this.svg,
    required this.text,
    this.background,
    this.border,
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
              color: background,
              borderRadius: BorderRadius.circular(8),
              border: border),
          child: Row(
            children: [
              svg!,
              Center(
                child: Text(
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
