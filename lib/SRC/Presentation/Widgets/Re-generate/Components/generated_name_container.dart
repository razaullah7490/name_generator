import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Presentation/Resources/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Resources/strings.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_shadow.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class GeneratedNameContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? spaceinicons;
  final bool? hascross;
  const GeneratedNameContainer({
    this.height,
    this.width,
    this.spaceinicons,
    this.hascross,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.white,
          boxShadow: [
            AppShadow.minimum(),
          ]),
      width: width ?? double.infinity.w,
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            hascross == true
                ? Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red[900],
                        ),
                        child: Icon(
                          Icons.close,
                          color: AppColors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            Row(
              children: <Widget>[
                AppText('Generated name',
                    style: Styles.smallPlusJakartaSans(context,
                        fontSize: 12.sp, color: AppColors.lebelTextColor))
              ],
            ),
            Row(
              children: [
                AppText('SoleCraft',
                    style: Styles.plusJakartaBold(
                      context,
                      fontSize: 19.sp,
                    )),
                // 80.x,

                Spacer(),
                SvgPicture.asset(
                  Assets.volume,
                ),

                15.x,
                SvgPicture.asset(Assets.copy),
                15.x,
                SvgPicture.asset(
                  Assets.bookmark,
                  color: Colors.grey,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                AppText('Meaning',
                    style: Styles.smallPlusJakartaSans(context,
                        fontSize: 12.sp, color: AppColors.lebelTextColor))
              ],
            ),
            Row(
              children: <Widget>[
                AppText('Expertly crafted shoes',
                    style: Styles.smallPlusJakartaSans(context,
                        fontSize: 13.sp, fontWeight: FontWeight.w500))
              ],
            ),
            10.y,
            Row(
              children: <Widget>[
                AppText('Short description',
                    style: Styles.smallPlusJakartaSans(context,
                        fontSize: 12.sp, color: AppColors.lebelTextColor))
              ],
            ),
            10.y,
            AppText(AppStrings.meaning,
                maxLine: 5,
                style: Styles.smallPlusJakartaSans(context,
                    fontSize: 14.sp, color: AppColors.blackvariant))
          ],
        ),
      ),
    );
  }
}
