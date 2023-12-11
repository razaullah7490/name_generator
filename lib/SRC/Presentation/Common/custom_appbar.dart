import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class CustomAppbar extends StatelessWidget {
  String title;

  IconData icon;
  bool? boolean;

  CustomAppbar({
    super.key,
    required this.title,
    required this.icon,
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
          child: Icon(icon),
        ),
      ],
    );
  }
}
