

 
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String hintText;
  final List<String> options;
  final TextEditingController controller;

  const CustomDropdownFormField({
    Key? key,
    required this.hintText,
    required this.options,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set an initial value (first option) if the controller is empty
    if (controller.text.isEmpty && options.isNotEmpty) {
      controller.text = options[0];
    }

    return SizedBox(
      // height: 0.06 * MediaQuery.of(context).size.height,
      child: DropdownButtonFormField<String>(
        value: controller.text,
        icon: const Icon(Icons.arrow_forward_ios),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Styles.smallPlusJakartaSans(context,
              color: AppColors.lebelTextColor),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10.r), 
          ),
        ),
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.text = newValue;
          }
        },
        items: options.map((String option){
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
        validator: (value) {
          return null;
        },
      ),
    );
  }
}
