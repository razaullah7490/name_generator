import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/BottomNavigation/bottom_navigation.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Components/Categories/Components/round_avatar.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/my_home_page.dart';
import 'package:name_generator/SRC/Presentation/Screens/Profile/Profilehistory/profile_history.dart';
import 'package:name_generator/SRC/Presentation/Screens/Profile/Profilenotifications/profile_notifications.dart';
import 'package:name_generator/SRC/Presentation/Screens/Profile/Profilesettings/profile_settings.dart';
import 'package:name_generator/SRC/Presentation/Screens/Profile/Supportandhelp/support_and_help.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> profileicons = [
    Assets.settingsfilled,
    Assets.notificationsfilled,
    Assets.clockfilled,
    Assets.helpcirclefilled,
    Assets.logoutfilled,
  ];

  List<String> titles = [
    'Settings',
    'Notifications',
    'History',
    'Support and Help',
    'Logout'
  ];

  List<Widget> screens = [
 ProfileSettings(), 
 ProfileNotifications(),
 ProfileHistory(),
 SupportAndHelp(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: Styles.plusJakartaBold(context, fontSize: 16.sp),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigate.to(context, const BottomNavigationScreen());
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const RoundAvatar(
                      icon: Assets.profileimage,
                      issvg: false,
                      imageheight: 100,
                      imagewidth: 100,
                      padding: 10,
                    ),
                    AppText('Muhammad Taif',
                        style: Styles.plusJakartaSans(
                          context,
                          fontSize: 16.sp,
                        )),
                    AppText('taif2115@gmail.com',
                        style: Styles.smallPlusJakartaSans(context,
                            fontSize: 12.sp, color: AppColors.lebelTextColor)),
                    10.y,
                    ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.sp,
                      ),
                      shrinkWrap: true,
                      itemCount: profileicons.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: GestureDetector(
                            onTap: () {
                              Navigate.to(context, screens[index]);
                            },
                            child: Container(
                              width: 20.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: AppColors
                                      .greyvariant1, // Set the border color to black
                                  width: 1.0, // Set the border width as needed
                                ),
                              ),
                              child: Row(
                                children: [
                                  20.x,
                                  SvgPicture.asset(
                                    profileicons[index],
                                  ),
                                  10.x,
                                  AppText(titles[index],
                                      style: Styles.plusJakartaSans(context,
                                          fontSize: 16.sp)),
                                  const Spacer(),
                                  SvgPicture.asset(Assets.arrowright),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

 