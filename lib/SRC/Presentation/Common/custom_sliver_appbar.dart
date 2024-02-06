import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class CustomSliverAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  String title;
  IconData? icon;
  bool? leading;

  CustomSliverAppbar({
    required this.title,
    this.icon,
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: leading ?? false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: AppText(
        title,
        style: Styles.plusJakartaSans(context,
            fontSize: 14.sp, fontWeight: FontWeight.w600),
        //textAlign: TextAlign.center,
      ),
      actions: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(icon, color: Colors.black45)),
      ],
    );
  }

  @override
  Size get preferredSize => Size(0.w, 20.h);
}
