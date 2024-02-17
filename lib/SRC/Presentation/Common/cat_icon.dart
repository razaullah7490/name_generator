import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

import '../Widgets/SubCategory/sub_category_screen.dart';

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
          Card(
            shape: const CircleBorder(),
            elevation: 1,
            child: Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xffDBE7F5))),
              child: Image.network(
                icon,
                width: 25.w,
                height: 25.h,
              ),
            ),
          ),

          // 5.y,

          AppText(
            title,
            style: Styles.plusJakartaSans(context,
                fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
