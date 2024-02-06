import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_appbar.dart';
import '../../../../Data/DataSource/Resources/utils.dart';




class ProfileNotificationSettings extends StatefulWidget {
  const ProfileNotificationSettings({super.key});

  @override
  State<ProfileNotificationSettings> createState() =>
      _ProfileNotificationSettingsState();
}


class _ProfileNotificationSettingsState
    extends State<ProfileNotificationSettings> {
  bool soundswitch = false;
  bool vibrateswitch = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Notification',
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  child: Column(
                    children: [
                      for (int i = 0; i < Utils().switchtitles.length; i++)
                        Row(
                          children: [
                            Text(
                             Utils().switchtitles[i],
                              style: Styles.plusJakartaSans(
                                context,
                                fontSize: 14.sp,
                                color: AppColors.blackvariant2,
                              ),
                            ),
                            const Spacer(),
                            Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                activeColor: AppColors.white,
                                activeTrackColor: AppColors.lightprimary,
                                inactiveTrackColor: Colors.white,
                                value: i == 0 ? soundswitch : vibrateswitch,
                                onChanged: (value) {
                                  setState(() {
                                    if (i == 0) {
                                      soundswitch = value;
                                    } else {
                                      vibrateswitch = value;
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
