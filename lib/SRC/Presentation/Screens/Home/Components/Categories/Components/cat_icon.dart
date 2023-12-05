import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

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
          Container(
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffDBE7F5))),
            child: Image.asset(
              icon,
              width: 25,
              height: 25,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.sp, top: 0.sp),
            child: AppText(title,
                style: Styles.plusJakartaBold(context, fontSize: 14.sp)),
          ),
        ],
      ),
    );
  }
}
