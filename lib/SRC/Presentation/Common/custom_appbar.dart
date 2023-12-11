import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/BottomNavigation/Widgets/bottom_navigation.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  String title;

  IconData icon;
  bool? boolean;

  CustomAppbar({
    required this.title,
    required this.icon,
    super.key,
    this.boolean,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 2,
      centerTitle: boolean,
      backgroundColor: AppColors.scaffoldColor,
      floating: true,
      pinned: true,
      title: AppText(
        title,
        style: Styles.plusJakartaSans(
          context,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.sp),
          child: const SizedBox(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => RepositoryProvider(
        create: (context) => SubjectRepository(),
        child: Size(0, 40.h),
      );
}
