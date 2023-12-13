import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

import '../../Data/DataSource/Resources/styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  IconData? icon;

  bool? autoleading;
  Widget? trailing;

  CustomAppbar({
    required this.title,
    this.autoleading,
    this.trailing,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: autoleading ?? false,
      elevation: 2,
      centerTitle: true,
      //pinned: true,
     // expandedHeight: 100,
      backgroundColor: AppColors.scaffoldColor,
      title: AppText(
        title,
        style: Styles.plusJakartaSans(context,
            fontSize: 16.sp, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.sp),
          child: trailing ?? const SizedBox(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(0, 40.h);
}
