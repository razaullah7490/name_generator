import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';

class CustomDropDownTextField extends StatelessWidget {
  final TextEditingController? controller;
  String text;
  Widget? suffixIcon;
  Widget? prefixIcon;
  // Function(String)? onChanged;
  List<String>? options;
  bool obscureText;
  String? Function(String?)? validator;
  Function(String)? onSelected;
  CustomDropDownTextField({
    super.key,
    this.options,
    this.onSelected,
    // this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.controller,
    required this.text,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }

          return options ?? [];
        },
        onSelected: onSelected,
        fieldViewBuilder: (BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          return TextFormField(
            focusNode: focusNode,
            //  onChanged: onChanged,
            controller: textEditingController,

            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              //  prefixIcon: prefixIcon,
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 18.r,
                color: Colors.grey,
              ),

              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10.r),
              ),
              hintText: text,
              hintStyle: Styles.smallPlusJakartaSans(
                context,
                fontSize: 12.sp,
                color: AppColors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            validator: validator,

            onFieldSubmitted: (String value) {
              onFieldSubmitted();
            },
          );
        },

        // optionsViewBuilder: (BuildContext context,
        //     AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        //   return Align(
        //     alignment: Alignment.topLeft,
        //     child: Material(
        //       child: Container(
        //         width: 300,
        //         height: 200,
        //         child: ListView.builder(
        //           itemCount: options.length,
        //           itemBuilder: (BuildContext context, int index) {
        //             final String option = options.elementAt(index);
        //             return GestureDetector(
        //               onTap: () {
        //                 onSelected(option);
        //               },
        //               child: ListTile(
        //                 title: Text(option),
        //               ),
        //             );
        //           },
        //         ),
        //       ),
        //     ),
        //   );
        // },
      ),
    );
  }
}
