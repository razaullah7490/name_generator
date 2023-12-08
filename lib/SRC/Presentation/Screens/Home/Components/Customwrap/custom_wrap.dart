import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Presentation/Common/cat_icon.dart';

class CustomWrap extends StatelessWidget {
  const CustomWrap({
    super.key,
    required this.categorynames,
    required this.categoryimages,
  });

  final List<String> categorynames;
  final List<String> categoryimages;

  @override
  Widget build(BuildContext context) {
    return Wrap(
    
      // spacing: 20.sp,
      alignment: WrapAlignment.spaceBetween,
      // runSpacing: 9.sp,
                              
      children: [
        
        for (int i = 0; i < categorynames.length; i++)
          CategoryTile(
            title: categorynames[i],
            icon: categoryimages[i],
          )
      ],
    );
  }
}
