import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import '../../Data/DataSource/Resources/color.dart';



class CustomButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  final Widget? iconData;
 final double? height;
 final double? width;

  const CustomButton({
    super.key,
    required this.text,
    required this.ontap,
   this.width,
    this.height,
    this.iconData,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??1.sw,
      height: height ??  0.07.sh,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
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
              iconData ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
