import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_appbar.dart';
import 'package:name_generator/SRC/Presentation/Common/round_avatar.dart';

class ProfileNotifications extends StatefulWidget {
  const ProfileNotifications({super.key});

  @override
  State<ProfileNotifications> createState() => _ProfileNotificationsState();
}

class _ProfileNotificationsState extends State<ProfileNotifications> {
  List<String> notificationIcon = [
    Assets.briefcase,
    Assets.man,
    Assets.dog,
  ];

  List<String> titles = ['Name Generated', 'Name Shared', 'Name Saved'];
  List<String> time = ['1h', '2h', '8h'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(title: 'Notifications', icon: Icons.more_vert),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                10.y,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText('TODAY',
                          style: Styles.mediumPlusJakartaSans(
                            context,
                            color: AppColors.greyvariant,
                            fontSize: 16.sp,
                          )),
                      AppText('Mark all as read',
                          style: Styles.smallPlusJakartaSans(context,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor))
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Column(
                        children: [
                          15.y,
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigate.to(
                                  //     context, EmptyProfileNotification());
                                },
                                child: RoundAvatar(
                                  icon: notificationIcon[index],
                                  issvg: false,
                                  haveborder: true,
                                  imageheight: 20.h,
                                  imagewidth: 20.w,
                                  padding: 15.sp,
                                ),
                              ),
                              10.x,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(titles[index],
                                        style: Styles.largePlusJakartaSans(
                                            context,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700)),
                                    AppText(AppStrings.notificationSuccess,
                                        maxLine: 4,
                                        style: Styles.mediumPlusJakartaSans(
                                            context,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              AppText(time[index],
                                  style: Styles.smallPlusJakartaSans(context,
                                      fontSize: 14,
                                      color: AppColors.greyvariant))
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
