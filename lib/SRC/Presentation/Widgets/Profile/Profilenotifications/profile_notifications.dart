import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Presentation/Resources/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Resources/strings.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_appbar.dart';
import 'package:name_generator/SRC/Presentation/Common/round_avatar.dart';
import '../../../Resources/utils.dart';
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
                            style: Styles.mediumPlusJakartaSans(context,
                                color: AppColors.greyvariant,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600)),
                        AppText('Mark all as read',
                            style: Styles.smallPlusJakartaSans(context,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: AppColors.blackColor))
                      ],
                    ),
                  ),
                  15.y,
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: Utils().notificationtitles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 15.sp),
                        child: GestureDetector(
                          onTap: () {
                            Navigate.to(
                                context, const EmptyProfileNotification());
                          },
                          child: Row(
                            children: [
                              RoundAvatar(
                                icon: Utils().profilenotification[index],
                                issvg: false,
                                haveborder: true,
                                imageheight: 20.h,
                                imagewidth: 20.w,
                                padding: 15.sp,
                              ),
                              10.x,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(Utils().notificationtitles[index],
                                        style: Styles.largePlusJakartaSans(
                                            context,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700)),
                                    AppText(AppStrings.notificationSuccess,
                                        maxLine: 4,
                                        style: Styles.mediumPlusJakartaSans(
                                            context,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                              AppText(Utils().notificationtimes[index],
                                  style: Styles.smallPlusJakartaSans(context,
                                      fontSize: 14,
                                      color: AppColors.greyvariant))
                            ],
                          ),
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
