import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_shadow.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';


class CustomDropDownWidget extends StatelessWidget {
  final Widget? prefixIcon;
  final String hintText;
  final Widget? icon;
  dynamic value;
  final double vMargin;
  final double hMargin;
  final double? dropDownHeight;
  final String validationText;
  final ValueChanged onChanged;
  final List<DropdownMenuItem<Object>> itemsMap;
  final bool isBorderRequired;
  final bool isShadowRequired;
  CustomDropDownWidget({
    this.icon,
    super.key,
    this.hMargin = 8,
    this.vMargin = 0,
    this.dropDownHeight,
    required this.prefixIcon,
    required this.hintText,
    required this.value,
    required this.validationText,
    required this.onChanged,
    required this.itemsMap,
    this.isBorderRequired = true,
    this.isShadowRequired = false,
  });

  final double borderRadius = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: isShadowRequired ? [AppShadow.normal()] : []),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          borderRadius: BorderRadius.circular(15),
          menuMaxHeight: dropDownHeight,
          validator: (value) {
            if (value == null) {
              return validationText;
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            hintStyle: Styles.plusJakartaSans(context,
                color: AppColors.lebelTextColor),
            fillColor: Colors.transparent,
            filled: true,
            prefixIconConstraints: BoxConstraints(
              maxHeight: 60.w,
              maxWidth: 50.w,
              minHeight: 22.w,
              minWidth: 23.w,
            ),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: prefixIcon,
                  )
                : null,
            errorMaxLines: 1,
            contentPadding: EdgeInsets.only(
              top: 13,
              bottom: 13,
              left: prefixIcon != null ? 8 : 0,
              right: prefixIcon != null ? 10 : 4,
            ),
            errorBorder: isBorderRequired
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius).r,
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.w,
                    ))
                : outlineInputBorder(),
            enabledBorder: isBorderRequired
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius).r,
                    borderSide: BorderSide(
                      color: AppColors.lightgrey,
                      width: 1.w,
                    ))
                : outlineInputBorder(),
            focusedBorder: isBorderRequired
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius).r,
                    borderSide: BorderSide(
                      color: AppColors.lightgrey,
                      width: 1.w,
                    ))
                : outlineInputBorder(),
            focusedErrorBorder: isBorderRequired
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius).r,
                    borderSide: BorderSide(
                      color: AppColors.lightgrey,
                      width: 1.w,
                    ))
                : outlineInputBorder(),
          ),
          hint: AppText(
            hintText,
            style: Styles.smallPlusJakartaSans(
              context,
              color: AppColors.lightgrey,
              fontSize: 14.sp,
            ),
          ),
          dropdownColor: Colors.white,
          icon: icon,
          iconSize: 28.r,
          isExpanded: true,
          style: Styles.smallPlusJakartaSans(
            context,
            fontSize: 14.sp,
          ),
          value: value,
          onChanged: onChanged,
          items: itemsMap,
        ),
      ),
    );
  }

  outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius.r),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}
