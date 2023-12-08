import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Business/business_category.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Components/Categories/Components/round_avatar.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({required this.title, required this.icon, super.key});

  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75.w,
      height: 80.h,
      // color: Colors.white,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigate.to(context, const BusinessCategory());
            },
            child: Card(
              shape: const CircleBorder(),
              elevation: 1,
              child: RoundAvatar(icon: icon, issvg: false, imageheight: 20.h, imagewidth: 20.w, padding: 15.sp, ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.sp, top: 0.sp),
            child: AppText(title,
                style: Styles.smallPlusJakartaSans(context, fontSize: 14.sp)),
          ),
        ],
      ),
    );
  }
}
