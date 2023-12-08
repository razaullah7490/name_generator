import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/BottomNavigation/bottom_navigation.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Form/Components/generated_name_container.dart';
import 'package:name_generator/SRC/Presentation/Screens/Saved/Components/saved_word.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Saved',
          style: Styles.plusJakartaBold(context, fontSize: 16.sp),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigate.to(context, BottomNavigationScreen());
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(Assets.dots),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                10.y,
                for (int i = 0; i < 5; i++)
                  Center(
                    child: GestureDetector(
                      onTap: () {
//                        showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return AlertDialog(
//       insetPadding: EdgeInsets.zero,
//       content: SingleChildScrollView(
//         child: Container(
//           height: 300,
//           width: 150,
//           child: GeneratedNameContainer(
//             height: 500, // You can adjust the height here if needed
//             width: 50,   
//           ),
//         ),
//       ),
//     );
//   },
// );

                      },
                      child: const SavedWord(),
                    ),
                  )
                ],
             ),
          ))
        ],
      ),
    );
  }
}
