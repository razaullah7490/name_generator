import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Screens/Auth/Widgets/SignUp/sign_up.dart';
import 'package:name_generator/SRC/Presentation/Screens/Form/Widgets/form.dart';

class BusinessCategory extends StatefulWidget {
  const BusinessCategory({super.key});

  @override
  State<BusinessCategory> createState() => _BusinessCategoryState();
}

class _BusinessCategoryState extends State<BusinessCategory> {
  int number = 0;

  List<String> categoryImages = [
    Assets.shuttle,
    Assets.resturant,
    Assets.web,
    Assets.fashion,
    Assets.marketing,
    Assets.plus,
  ];

  @override
  Widget build(BuildContext context) {
    List<String> radioTileTitles = [
      'Startup',
      'Restaurant',
      'Web development',
      'Fashion',
      'Marketing',
      'Other',
    ];

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
              title: Text(
                "Business - Choose a Subcategory",
                style: Styles.mediumPlusJakartaSans(context,
                    color: AppColors.blackColor, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
              actions: [
                IconButton(
                  icon: Image.asset(
                    Assets.close,
                    width: 24.0,
                    height: 24.0,
                  ),
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
                    child: RadioListTile(
                      hoverColor: AppColors.primaryColor,
                      title: Row(
                        children: [
                          Image.asset(
                            categoryImages[index].trim(),
                            color:
                                number == index ? AppColors.primaryColor : null,
                            width: 24.0,
                            height: 24.0,
                          ),
                          16.x,
                          Text(
                            radioTileTitles[index],
                            style: Styles.mediumPlusJakartaSans(context,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500),
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
                  return 16.y;
                },
                itemCount: radioTileTitles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
