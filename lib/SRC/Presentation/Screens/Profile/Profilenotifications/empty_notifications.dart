import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_appbar.dart';

class EmptyProfileNotification extends StatefulWidget {
  const EmptyProfileNotification({super.key});

  @override
  State<EmptyProfileNotification> createState() =>
      _ProfileNotificationSettingsState();
}

class _ProfileNotificationSettingsState
    extends State<EmptyProfileNotification> {
  bool soundswitch = false;
  bool vibrateswitch = false;
  List<String> switchtitles = ['Sound', 'Vibrate'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Notifications',
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.emptynotication),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    children: [
                      AppText(
                        AppStrings.emptynotif,
                        maxLine: 3,
                        style: Styles.plusJakartaSans(context,
                            fontSize: 20.sp, color: AppColors.blackvariant3),
                      ),
                      AppText(
                        textAlign: TextAlign.center,
                        AppStrings.emptynotif1,
                        maxLine: 4,
                        style: Styles.plusJakartaSans(context,
                            color: AppColors.greyvariant3,
                            fontSize: 18.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
