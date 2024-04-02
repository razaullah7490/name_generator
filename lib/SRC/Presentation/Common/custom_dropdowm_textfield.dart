import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Presentation/Resources/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';

class CustomDropDownTextField extends StatelessWidget {
  final TextEditingController? controller;
  String text;

  bool? sf;
  // Function(String)? onChanged;
  List<String>? options;
  String? title;
  String? Function(String?)? validator;
  Function(String?)? onSelected;
  CustomDropDownTextField({
    super.key,
    this.options,
    this.sf = true,
    this.onSelected,
    this.title,
    // this.onChanged,

    this.validator,
    this.controller,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: Styles.plusJakartaSans(context,
                fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
          5.y,
          Container(
            color: Colors.white,
            child: DropdownMenu<String>(
              width: 320.w,
              hintText: text,
              controller: controller,
              enableFilter: true,
              requestFocusOnTap: true,
              trailingIcon: sf ?? true
                  ? Icon(
                      Icons.arrow_forward_ios,
                      size: 18.r,
                      color: Colors.grey,
                    )
                  : null,
              inputDecorationTheme: InputDecorationTheme(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                hintStyle: Styles.smallPlusJakartaSans(
                  context,
                  fontSize: 12.sp,
                  color: AppColors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onSelected: onSelected,
              dropdownMenuEntries: options!.map(
                (String valu) {
                  return DropdownMenuEntry<String>(
                    value: valu,
                    label: valu,
                    //leadingIcon: Icon(icon.icon),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
