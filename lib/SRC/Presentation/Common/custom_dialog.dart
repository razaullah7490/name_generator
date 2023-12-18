import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widgets/Dashboard/Home/Form/Components/generated_name_container.dart';


class CustomDIalog extends StatelessWidget {
  const CustomDIalog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // scrollable: true,
      // contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 24,vertical:MediaQuery.sizeOf(context).height*0.22),
      child: const GeneratedNameContainer(
        spaceinicons: 60,
        height: 500,

        // width: 50,
      ),
    );
  }
}
