
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';


class GeneratedNameContainer extends StatelessWidget {
  final double? height; 
  final double? width; 
  final double ? spaceinicons;
  final bool? hascross;
  const GeneratedNameContainer({

    this.height, this.width,this.spaceinicons,  this.hascross,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: AppColors.white,
          border: Border.all(
            color: Colors.grey,
          )),
      width: width ?? 300.w,
      height: height ?? 300.h,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             hascross == true ?
            Align(alignment: Alignment.topRight,
              child: InkWell(onTap: ()=>Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red,),
                  child: Icon(Icons.close,color: AppColors.white,size: 14,),
                ),),
            ):
                 SizedBox(),
            Row(
              children: <Widget>[
                AppText('Generated name',
                    style: Styles.smallPlusJakartaSans(context,
                        fontSize: 12.sp,
                        color: AppColors.lebelTextColor))
              ],
            ),

            Row(
              children: [
                AppText('SoleCraft',
                    style: Styles.plusJakartaBold(context,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold)),
                // 80.x,
                  SizedBox(width: spaceinicons?? 80.sp,),
                SvgPicture.asset(
                  Assets.volume,
                ),
                15.x,
                SvgPicture.asset(Assets.bookmark),
                15.x,
                SvgPicture.asset(Assets.copy),
              ],
            ),
            Row(
              children: <Widget>[
                AppText('Meaning',
                    style: Styles.smallPlusJakartaSans(context,
                        fontSize: 12.sp,
                        color: AppColors.lebelTextColor))
              ],
            ),
            Row(
              children: <Widget>[
                AppText('Expertly crafted shoes',
                    style: Styles.smallPlusJakartaSans(context,
                        fontSize: 16.sp,
                        color: AppColors.blackvariant))
              ],
            ),
            10.y,
            Row(
              children: <Widget>[
                AppText('Short description',
                    style: Styles.smallPlusJakartaSans(context,
                        fontSize: 12.sp,
                        color: AppColors.lebelTextColor))
              ],
            ),
            10.y,
            AppText(AppStrings.meaning,
                maxLine: 5,
                style: Styles.smallPlusJakartaSans(context,
                    fontSize: 14.sp,
                    color: AppColors.blackvariant))
          ],
        ),
      ),
    );
  }
}
