import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';

class CustomAppbar extends StatelessWidget {
  String title;
  IconData icon;
  CustomAppbar({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: true,
      elevation: 2,
      centerTitle: true,
      backgroundColor: AppColors.scaffoldColor,
      floating: true,
      pinned: false,
      title: AppText(
        title,
        style: const TextStyle(color: AppColors.blackColor),
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
