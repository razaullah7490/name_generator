

import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class CustomAppbar extends StatelessWidget {
  String title;
  IconData icon;
  bool? boolean;
  CustomAppbar({
    required this.title,
    required this.icon,
    super.key,
    this.boolean,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 2,
      centerTitle: boolean,
      backgroundColor: AppColors.scaffoldColor,
      floating: true,
      pinned: true,
      title: AppText(
        title,
        style: Styles.plusJakartaSans(
          context,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        ),
      ],
    );
  }
}
