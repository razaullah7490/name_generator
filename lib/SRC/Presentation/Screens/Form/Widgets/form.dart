import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_dropdown.dart';
import 'package:name_generator/SRC/Presentation/Screens/onboarding/Widgets/onboarding_screen.dart';

import '../../../Common/custom_appbar.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _keywordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> fieldText = [
      'Key word',
      'Restaurant',
      'Web development',
      'Fashion',
      'Marketing',
      'Other',
    ];

    List<String> hintText = [
      'StarMaking, etc',
      'English, etc',
      'Business, etc',
      'Fashion, etc',
      'Branded, etc',
      'TwoWords, etc',
    ];
    List<String> categoryList = ['category1', 'category2', "category3"];
    String? selectedCategory;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white.withOpacity(0.94),
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              CustomAppbar(
                title: "Fill the form",
                icon: Icons.cancel_outlined,
                boolean: false,
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 42.sp, right: 24.sp, left: 24.sp),
                sliver: SliverList.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fieldText[index],
                          textAlign: TextAlign.start,
                          style: Styles.smallPlusJakartaSans(context,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightgrey),
                        ),
                        5.y,
                        CustomDropDownWidget(
                          icon: index == 0
                              ? AppText(
                                  "Options",
                                  style: Styles.smallPlusJakartaSans(
                                    context,
                                    color: AppColors.lightgrey,
                                    fontSize: 14.sp,
                                  ),
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.lightgrey,
                                  size: 16,
                                ),
                          isBorderRequired: true,
                          prefixIcon: null,
                          hintText: hintText[index],
                          value: selectedCategory,
                          validationText: 'Please Select Category',
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value;
                            });
                          },
                          itemsMap: [
                            for (int i = 0; i < categoryList.length; i++)
                              DropdownMenuItem(
                                value: categoryList[i],
                                child: AppText(
                                  categoryList[i],
                                  style: Styles.plusJakartaSans(context,
                                      color: AppColors.lebelTextColor),
                                ),
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 16.y;
                  },
                  itemCount: fieldText.length,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            text: "Generate ",
            ontap: () {},
            iconData: const Icon(
              Icons.switch_access_shortcut_add_rounded,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
