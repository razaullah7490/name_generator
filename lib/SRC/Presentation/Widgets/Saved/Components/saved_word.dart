import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Presentation/Resources/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_shadow.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.white,
            boxShadow: [AppShadow.normal()]),
        width: width ?? double.infinity.w,
        height: height ?? 90.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppText('Sole craft',
                style: Styles.smallPlusJakartaSans(
                  context,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: AppColors.blackvariant1,
                )),
            Row(
              children: [
                Image.asset(
                  Assets.briefcase,
                  width: 13.w,
                  height: 13.h,
                ),
                8.x,
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
    );
  }
}
