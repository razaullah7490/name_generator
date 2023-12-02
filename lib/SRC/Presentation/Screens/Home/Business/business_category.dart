import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';

class BusinessCategory extends StatelessWidget {
  const BusinessCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> radioTileTitles = [
      'Startup',
      'Resturant',
      'Web development',
      'Fashion',
      'Marketing',
      'Other',
    ];

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Business - Choose a Subcategory",
                    style: Styles.mediumPlusJakartaSans(context,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.close))
                ],
              ),
              20.y,
              SingleChildScrollView(
                child: SizedBox(
                  height: 0.6.sh,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: radioTileTitles.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: RadioListTile(
                          title: Row(
                            children: [
                              const Image(
                                  height: 20,
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    Assets.onboardImg,
                                  )),
                              Text(radioTileTitles[index]),
                            ],
                          ),
                          value: index,
                          groupValue: null,
                          onChanged: (value) {},
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return 16.y;
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
