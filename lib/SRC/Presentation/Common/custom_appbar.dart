import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class CustomAppbar extends StatelessWidget {
  String title;
<<<<<<<<< Temporary merge branch 1
  IconData icon;
  bool? boolean;
=========
  IconData? icon;
  String? leading;
  bool?   autoleading;
  Widget? trailing; 

  CustomAppbar({
    super.key,
    required this.title,
    this.autoleading, 
    this.trailing, 
    this.icon,
    this.leading,
    super.key,
    this.boolean,
  });

  @override
  Widget build(BuildContext context) {
<<<<<<<<< Temporary merge branch 1
    return SliverAppBar(
      automaticallyImplyLeading: false,
=========
    return AppBar(
      automaticallyImplyLeading: autoleading??false,
>>>>>>>>> Temporary merge branch 2
      elevation: 2,
      centerTitle: true,
      backgroundColor: AppColors.scaffoldColor,
<<<<<<<<< Temporary merge branch 1
      floating: true,
      pinned: true,
      title: AppText(
        title,
        style: Styles.plusJakartaSans(
          context,
        ),
=========
      title: AppText(
        title,
        style: Styles.plusJakartaSans(context,
            fontSize: 16.sp, fontWeight: FontWeight.w600),
>>>>>>>>> Temporary merge branch 2
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
}
