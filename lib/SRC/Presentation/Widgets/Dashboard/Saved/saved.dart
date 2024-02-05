import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Common/round_avatar.dart';
import '../../../Common/custom_appbar.dart';
import '../Home/Form/Components/generated_name_container.dart';
import 'Components/saved_word.dart';

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
                              return AlertDialog(
                                contentPadding: EdgeInsets.all(0.sp),
                                content: const GeneratedNameContainer(
                                  hascross: true,
                                
                                  height: 320,
                                  width: 300,
                                ),
                              );
                            },
                          );
                        },
                        child: SavedWord(
                          tapoption: RoundAvatar(
                            issvg: true,
                            icon: Assets.bookmarkfilled,
                            // haveborder: true,
                            padding: 10.sp,
                            imageheight: 12.h,
                            imagewidth: 12.w,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
