import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import '../../Re-generate/Components/generated_name_container.dart';
import '../../Saved/Components/saved_word.dart';



class ProfileHistory extends StatelessWidget {
  const ProfileHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'History',
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
      body: Column(
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
                            return  AlertDialog(
                              contentPadding: EdgeInsets.all(0.sp ),
                              content: const GeneratedNameContainer(
                                hascross: true,
                                spaceinicons: 50,
                                height: 320,
                                width: 85,
                              ),
                            );

                          },
                        );
                      },
                      child: SavedWord(   tapoption: SvgPicture.asset(Assets.dots),),
                    ),
                  )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
