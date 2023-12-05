import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Screens/Chat/chat.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/BottomNavigation/Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/my_home_page.dart';
import 'package:name_generator/SRC/Presentation/Screens/Profile/profile.dart';
import 'package:name_generator/SRC/Presentation/Screens/Saved/saved.dart';

class BottomNavigationScreen extends StatefulWidget {
  final int? initialPage;
  const BottomNavigationScreen({super.key, this.initialPage});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BottomNotifier.bottomNavigationNotifier.value = 0;
    });
    BottomNotifier.bottomPageController =
        PageController(initialPage: widget.initialPage ?? 0);

    BottomNotifier.checkExitTimes.value = 2;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (BottomNotifier.bottomPageController!.page != 0) {
          BottomNotifier.bottomNavigationNotifier.value = 0;
          BottomNotifier.checkExitTimes.value = 2;
          BottomNotifier.bottomPageController!.jumpToPage(0);
        }

        return false;
      },
      child: Scaffold(
          body: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: PageView(
              controller: BottomNotifier.bottomPageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (x) {
                print(x);
                BottomNotifier.bottomNavigationNotifier.value = x;
              },
              children: const [
                MyHomePage(),
                Saved(),
                Chat(),
                Profile(),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            height: 60,
            color: AppColors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: ValueListenableBuilder(
              builder: (context, state, ss) {
                return Row(
                  //children inside bottom appbar
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //5.x,
                    ///Home
                    GestureDetector(
                      onTap: () {
                        if (state != 0) {
                          BottomNotifier.bottomPageController!.jumpToPage(0);
                          BottomNotifier.bottomNavigationNotifier.value = 0;
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            state == 0 ? Assets.homefilled : Assets.home,
                          ),
                          AppText("Home",
                              style: Styles.smallPlusJakartaSans(context,
                                  color: state == 0
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),

                    ///Saved
                    GestureDetector(
                      onTap: () {
                        if (state != 1) {
                          BottomNotifier.bottomPageController!.jumpToPage(1);
                          BottomNotifier.bottomNavigationNotifier.value = 1;
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(state == 1
                              ? Assets.bookmarkfilled
                              : Assets.bookmark),
                          AppText("Saved",
                              style: Styles.smallPlusJakartaSans(context,
                                  color: state == 1
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),

                    ///Chat
                    GestureDetector(
                      onTap: () {
                        if (state != 2) {
                          BottomNotifier.bottomPageController!.jumpToPage(2);
                          BottomNotifier.bottomNavigationNotifier.value = 2;
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                              state == 2 ? Assets.robotfilled : Assets.robot),
                          AppText("Chat",
                              style: Styles.largePlusJakartaSans(context,
                                  color: state == 2
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),

                    ///Profile
                    GestureDetector(
                      onTap: () {
                        if (state != 3) {
                          BottomNotifier.bottomPageController!.jumpToPage(3);
                          BottomNotifier.bottomNavigationNotifier.value = 3;
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(state == 3
                              ? Assets.profilefilled
                              : Assets.profile),
                          AppText("Profile",
                              style: Styles.plusJakartaSans(context,
                                  color: state == 3
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    )
                  ],
                );
              },
              valueListenable: BottomNotifier.bottomNavigationNotifier,
            ),
          )),
    );
  }
}
