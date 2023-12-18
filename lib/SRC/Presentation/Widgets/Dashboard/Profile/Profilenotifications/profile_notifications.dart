import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_appbar.dart';
import 'package:name_generator/SRC/Presentation/Common/round_avatar.dart';
import '../../../../../Data/DataSource/Resources/utils.dart';
import 'empty_notifications.dart';
import 'profile_notifications_settings.dart';



class ProfileNotifications extends StatefulWidget {
  const ProfileNotifications({super.key});

  @override
  State<ProfileNotifications> createState() => _ProfileNotificationsState();
}

class _ProfileNotificationsState extends State<ProfileNotifications> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: 'Notification',
          trailing: GestureDetector(
              onTap: () {
                Navigate.to(context, const ProfileNotificationSettings());
              },
              child: SvgPicture.asset(Assets.dots)),
        ),
        body: Column(
          children: [
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
                    itemCount: Utils().notificationtitles.length,
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
                                    Navigate.to(context,
                                        const EmptyProfileNotification());
                                  },
                                  child: RoundAvatar(
                                    icon: Utils().profilenotification[index],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(Utils().notificationtitles[index],
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
                                AppText( Utils().notificationtimes[index],
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
        ));
  }
}
