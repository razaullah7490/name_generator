import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Form/Components/generated_name_container.dart';

class CustomDIalog extends StatelessWidget {
  const CustomDIalog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0.sp),
      insetPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: Container(
          height: 300,
          width: 150,
          child: const GeneratedNameContainer(
            spaceinicons: 60,
            height: 500,  
            width: 50,
          ),
        ),
      ),
    );
  }
}
