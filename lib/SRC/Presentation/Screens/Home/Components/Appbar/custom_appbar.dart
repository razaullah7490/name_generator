
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final String? icon;

  const CustomAppbar({super.key, this.title, this.subtitle, this.icon});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size(0, 50.h);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          AppText(widget.title??'',
                              style: Styles.smallPlusJakartaSans(
                                context,
                                fontSize: 16.sp,
                              )),
                          AppText(widget.subtitle!,
                              style: Styles.smallPlusJakartaSans(context,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(6.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xffDBE7F5))),
                      child: SvgPicture.asset(
                        widget.icon!,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
