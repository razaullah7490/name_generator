import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_button.dart';
import 'Components/generated_name_container.dart';

class NameGenerated extends StatefulWidget {
  const NameGenerated({super.key, required Map<String, dynamic?> data})
      : _data = data;
  final Map<String, dynamic?> _data;

  Map<String, dynamic?> get data => _data;

  @override
  State<NameGenerated> createState() => _FormScreenState();
}

class _FormScreenState extends State<NameGenerated> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Re-generate if Needed',
            style: Styles.largePlusJakartaSans(
              context,
              fontSize: 14.sp,
            ),
          ),
        ),
        backgroundColor: AppColors.white.withOpacity(0.94),
        body: Padding(
          padding:  EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              20.y,
              GeneratedNameContainer(spaceinicons: 70),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            text: "Generate",
            ontap: () {
              // Access the data using widget.data
              Map<String, dynamic?> data = widget.data;
              printData(data);
            },
            iconData: Image.asset(Assets.sparkle),
          ),
        ),
      ),
    );
  }

  void printData(Map<String, dynamic?> data) {
   
    print("Data: $data");
    // You can also display the data in the UI, update state, etc.
  }
}
