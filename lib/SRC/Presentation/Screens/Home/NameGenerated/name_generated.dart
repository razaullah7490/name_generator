import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Form/Components/generated_name_container.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';

import '../../onboarding/Widgets/onboarding_screen.dart';

class NameGenerated extends StatefulWidget {
  const NameGenerated({super.key});

  @override
  State<NameGenerated> createState() => _FormScreenState();
}

class _FormScreenState extends State<NameGenerated> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Re-generate if Needed',
            style: Styles.largePlusJakartaSans(
              context,
              fontSize: 16.sp,
            ),
          ),
        ),
        backgroundColor: AppColors.white.withOpacity(0.94),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  20.y,
                  Center(
                    child: GeneratedNameContainer(),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            text: "Generate ",
            ontap: () {},
            iconData: const Icon(Icons.abc),
          ),
        ),
      ),
    );
  }
}

