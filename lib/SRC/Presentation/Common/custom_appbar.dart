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
  IconData? icon;
  String? leading;
  bool?   autoleading;
  Widget? trailing; 

  CustomAppbar({
    required this.title,
    this.autoleading, 
    this.trailing, 
    this.icon,
    this.leading,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: autoleading??false,
      elevation: 2,
      centerTitle: true,
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
        child: trailing??SizedBox(), 
      ), 
      ],   
    );
  }

  @override
  Size get preferredSize => Size(0, 40.h);
}
