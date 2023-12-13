import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class CustomAppbar extends StatelessWidget {
  String title;
  IconData? icon;
  bool? leading;

  CustomAppbar({
    required this.title,
    this.icon,
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: leading??false,
      elevation: 2,
      centerTitle: true,
pinned: true,
      expandedHeight: 100,
      backgroundColor: AppColors.scaffoldColor,
      title: AppText(
        title,
        style: Styles.plusJakartaSans(context,
            fontSize: 16.sp, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(padding: EdgeInsets.only(right: 20.sp), child: Icon(icon)),
      ],
    );
  }
}
