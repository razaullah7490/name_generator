import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class SupportAndHelp extends StatefulWidget {
  const SupportAndHelp({super.key});

  @override
  State<SupportAndHelp> createState() => _ProfileNotificationsState();
}

class _ProfileNotificationsState extends State<SupportAndHelp> {
  List<String> questions = [
    AppStrings.faq1,
    AppStrings.faq2,
    AppStrings.faq2,
    AppStrings.faq2
  ];
  List<String> answers = [
    AppStrings.faqanswer1,
    AppStrings.faqanswer2,
    AppStrings.faqanswer2,
    AppStrings.faqanswer2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Support and Help',
          style: Styles.plusJakartaBold(context, fontSize: 16.sp),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(Assets.dots),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: AppText(AppStrings.faq,
              style: Styles.mediumPlusJakartaSans(
                context,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackvariant,
              )),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.y,
                    AppText(questions[index],
                        style: Styles.plusJakartaSans(
                          context,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackvariant,
                        )),
                    5.y,
                    AppText(answers[index],
                        maxLine: 3,
                        style: Styles.plusJakartaSans(context,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyvariant)),
                    10.y,
                    Container(
                      color: AppColors.outline,
                      height: 1.0,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
