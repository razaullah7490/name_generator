import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:name_generator/SRC/Presentation/Resources/Navigation/navigation.dart';
import 'package:name_generator/SRC/Presentation/Resources/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_shadow.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/round_avatar.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Auth/Login/login_screen.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Profile/cubit/profile_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Profile/cubit/profile_state.dart';

import 'Profilehistory/profile_history.dart';
import 'Profilenotifications/profile_notifications.dart';
import 'Profilesettings/profile_settings.dart';
import 'Supportandhelp/support_and_help.dart';

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
    // Assets.logoutfilled,
  ];

  List<String> titles = [
    'Settings',
    'Notifications',
    'History',
    'Support and Help',
    // 'Logout'
  ];

  List<Widget> screens = [
    const ProfileSettings(),
    const ProfileNotifications(),
    const ProfileHistory(),
    const SupportAndHelp(),
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          "Profile",
          style: Styles.plusJakartaSans(context),
        ),
        // actions: [  SvgPicture.asset(Assets.dots), 10.x],
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ProfileLoading,
            progressIndicator: CircularProgressIndicator(),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                child: Column(
                  children: [
                    cubit.authService.appUser.image == null
                        ? CircleAvatar(
                            radius: 60.r,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white,
                            ))
                        : CircleAvatar(
                            radius: 60.r,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                                '${cubit.authService.appUser.image}'),
                          ),
                    AppText('${cubit.authService.appUser.name ?? ""}',
                        style: Styles.plusJakartaSans(
                          context,
                          fontSize: 16.sp,
                        )),
                    AppText('${cubit.authService.appUser.email ?? ""}',
                        style: Styles.smallPlusJakartaSans(context,
                            fontSize: 12.sp, color: AppColors.lebelTextColor)),
                    36.y,
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: profileicons.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: GestureDetector(
                            onTap: () {
                              log('${cubit.authService.appUser.image}');
                              log('${cubit.authService.appUser.name}');
                              Navigate.to(context, screens[index]);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 48.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: AppColors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  boxShadow: [
                                    AppShadow.minimum(),
                                  ]),
                              child: Row(
                                children: [
                                  20.x,
                                  SvgPicture.asset(
                                    profileicons[index],
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                  10.x,
                                  AppText(titles[index],
                                      style: Styles.plusJakartaSans(context,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp)),
                                  const Spacer(),
                                  SvgPicture.asset(Assets.arrowright),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    5.y,
                    GestureDetector(
                      onTap: () {
                        context.read<ProfileCubit>().logOut(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              AppShadow.minimum(),
                            ]),
                        child: Row(
                          children: [
                            20.x,
                            SvgPicture.asset(
                              Assets.logoutfilled,
                              width: 20.w,
                              height: 20.h,
                            ),
                            10.x,
                            AppText('Logout',
                                style: Styles.plusJakartaSans(context,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp)),
                            const Spacer(),
                            SvgPicture.asset(Assets.arrowright),
                          ],
                        ),
                      ),
                    ),
                    30.y,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
