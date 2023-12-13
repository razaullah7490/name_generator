import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_dialog.dart';
import 'package:name_generator/SRC/Presentation/Common/round_avatar.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Form/Components/generated_name_container.dart';
import 'package:name_generator/SRC/Presentation/Screens/Saved/Components/saved_word.dart';

import '../../Common/custom_appbar.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Saved',
        autoleading: true,
        trailing: SvgPicture.asset(Assets.dots),
      ),
      body: Expanded(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  10.y,
                  for (int i = 0; i < 5; i++)
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomDIalog();
                            },
                          );
                        },
                        child: SavedWord(
                          tapoption: RoundAvatar(
                            issvg: true,
                            icon: Assets.bookmarkfilled,
                            haveborder: true,
                            padding: 10.sp,
                            imageheight: 12.h,
                            imagewidth: 12.w,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
