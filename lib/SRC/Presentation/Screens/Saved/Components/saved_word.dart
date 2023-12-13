import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';



class SavedWord extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? tapoption;
  const SavedWord({
    this.height,
    this.width,
    this.tapoption,
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.sp),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.white,
            border: Border.all(
              color: Colors.grey,
            )),
        width: width ?? 300.w,
        height: height ?? 100.h,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  AppText('Sole craft',
                      style: Styles.smallPlusJakartaSans(context,
                          fontSize: 16.sp, color: AppColors.blackvariant1))
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    Assets.briefcase,
                    width: 13.w,
                    height: 13.h,
                  ),
                  5.x,
                  AppText('Business name',
                      style: Styles.mediumPlusJakartaSans(context,
                          fontSize: 14.sp, color: AppColors.greyvariant)),
                  Spacer(),
                  tapoption ?? SizedBox(),
                ],
              ),
              Row(
                children: <Widget>[
                  SvgPicture.asset(Assets.clock),
                  5.x,
                  AppText('2 hours ago',
                      style: Styles.smallPlusJakartaSans(context,
                          fontSize: 12.sp, color: AppColors.lebelTextColor))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
