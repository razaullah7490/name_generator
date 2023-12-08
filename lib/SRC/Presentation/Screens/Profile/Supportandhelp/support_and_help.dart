import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class SupportAndHelp extends StatefulWidget {
  const SupportAndHelp({super.key});

  @override
  State<SupportAndHelp> createState() => _ProfileNotificationsState();
}

class _ProfileNotificationsState extends State<SupportAndHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Support and Help',
          style: Styles.plusJakartaBold(context, fontSize: 16.sp),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(Assets.dots),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(AppStrings.faq,
                  style: Styles.mediumPlusJakartaSans(
                    context,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackvariant,
                  )),
              20.y,
              AppText('How do i reset my password?',
                  style: Styles.plusJakartaSans(
                    context,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  )),
              AppText(
                  'Visit the password reset page and follow the instructions.', maxLine: 3,
                  style: Styles.plusJakartaSans(context,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyvariant2))
            ],
          ),
        ))
      ]),
    );
  }
}
