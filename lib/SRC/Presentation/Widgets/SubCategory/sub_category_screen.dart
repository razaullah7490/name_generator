import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_sliver_appbar.dart';
import '../../Resources/utils.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({super.key});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.white.withOpacity(0.94),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              CustomSliverAppbar(
                  title: 'Business - Choose a SubCategory',
                  icon: Icons.cancel_outlined),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                sliver: SliverList.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.white,
                      elevation: 0.4,
                      child: RadioListTile(
                        selectedTileColor: AppColors.primaryColor,
                        hoverColor: AppColors.primaryColor,
                        title: Row(
                          children: [
                            Image.asset(
                              Utils().businesscategoryImages[index].trim(),
                              color: number == index
                                  ? AppColors.primaryColor
                                  : null,
                              width: 24.0,
                              height: 24.0,
                            ),
                            16.x,
                            Text(
                              Utils().businessradioTileTitles[index],
                              style: Styles.mediumPlusJakartaSans(context,
                                  color: AppColors.blackColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        value: index,
                        groupValue: number,
                        onChanged: (value) {
                          setState(() {
                            number = value!;
                          });
                          print(value);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 15.y;
                  },
                  itemCount: Utils().businessradioTileTitles.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
