import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class CustomButton extends StatelessWidget {
  String text;
  Function() ontap;
  Widget? iconData;

  CustomButton({
    super.key,
    required this.text,
    required this.ontap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 13.h),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text,
              style: const TextStyle(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
            iconData!
          ],
        ),
      ),
    );
  }
}
