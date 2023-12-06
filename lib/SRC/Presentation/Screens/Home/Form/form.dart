import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';

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
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.white.withOpacity(0.94),
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                floating: false,
                pinned: true,
                title: Text(
                  "Fill the form",
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fieldText[index],
                          textAlign: TextAlign.start,
                          style: Styles.smallPlusJakartaSans(context,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lebelTextColor),
                        ),

                        5.y,
                        SizedBox(
                          height: 0.06.sh,
                          child: TextFormField(
                            controller: _keywordController,
                            decoration: InputDecoration(
                              hintText: hintText[index],
                              hintStyle: Styles.smallPlusJakartaSans(context,
                                  color: AppColors.lebelTextColor
                                      .withOpacity(0.2)),
                              suffix: Text(
                                "Options",
                                style: Styles.smallPlusJakartaSans(context,
                                    color: AppColors.lebelTextColor
                                        .withOpacity(0.6)),
                                textAlign: TextAlign.center,
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.grey),
                                borderRadius: BorderRadius.circular(10),
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
                    return 16.y;
                  },
                  itemCount: fieldText.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
