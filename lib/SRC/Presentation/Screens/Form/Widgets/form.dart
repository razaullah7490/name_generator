import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_dropdown.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/NameGenerated/name_generated.dart';
import 'package:name_generator/SRC/Presentation/Screens/onboarding/Widgets/onboarding_screen.dart';




import '../../../Common/custom_appbar.dart';
import '../Components/custom_drop_down_form_field.dart';

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
      'Startup',
      'Restaurant',
      'Web development',
      'Fashion',
      'Marketing',
      'Other',
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
                        const SizedBox(height: 5.0),
                        index == 0
                            ? CustomDropdownFormField(
                                hintText: hintText[index],
                                options: const ["Option 1", "Option 2", "Option 3"],
                                controller: _keywordController,
                              )
                            : SizedBox(
                                // height: 0.06 * MediaQuery.of(context).size.height,
                                child: TextFormField(
                                  controller: index == 0
                                      ? _keywordController
                                      : _passwordController,
                                  decoration: InputDecoration(
                                    hintText: hintText[index],
                                    hintStyle: Styles.smallPlusJakartaSans(context,
                                        color: AppColors.lebelTextColor),
                                    suffixIcon: index == 0
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 10.0),
                                            child: Text(
                                              "Options",
                                              style: Styles.smallPlusJakartaSans(
                                                  context,
                                                  color: AppColors.lebelTextColor),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        : const Icon(
                                            Icons.arrow_forward_ios,
                                            color: AppColors.lebelTextColor,

                                          ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(color: AppColors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                              ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 16.0);
                  },
                  itemCount: fieldText.length,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton( iconData: Image.asset(Assets.sparkle),
            text: "Generate ",
            ontap: () {
              Navigate.to(context, const NameGenerated());
            },
          ),
        ),
      ),
    );
  }
}








