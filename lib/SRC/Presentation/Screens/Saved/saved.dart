import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.white.withOpacity(0.94),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              floating: false,
              pinned: true,
              centerTitle: true,
              leading: const Icon(Icons.keyboard_backspace_rounded),
              title: Text(
                "Saved",
                style: Styles.mediumPlusJakartaSans(context,
                    color: AppColors.blackColor, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 42.sp, right: 24.sp, left: 24.sp),
              sliver: SliverList.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        color: Colors.white,
                        elevation: 0.4,
                        child: Container());
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 16.y;
                  },
                  itemCount: 4),
            ),
          ],
        ),
      ),
    );
  }
}
