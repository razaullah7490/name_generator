import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Form/Components/generated_name_container.dart';
import 'package:name_generator/SRC/Presentation/Screens/Saved/Components/saved_word.dart';

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
                                spaceinicons: 60,
                                height: 300,
                                width: 50,
                              ),
                            );
                          },
                        );
                      },
                      child: SavedWord(tapoption: SvgPicture.asset(Assets.dots),),
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
