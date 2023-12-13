import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Screens/Business/Widgets/business_category.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({required this.title, required this.icon, super.key});

  final String title;
  final String icon;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 106.h,

      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigate.to(context, const BusinessCategory());
            },
            child: Card(
              shape: const CircleBorder(),
              elevation: 1,
              child: Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xffDBE7F5))),
                child: Image.asset(

                  icon,
                  width: 24.w,
                  height: 24.h,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.sp, top: 0.sp),
            child: AppText(title,
                style: Styles.smallPlusJakartaSans(context, fontSize: 14.sp,  fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
