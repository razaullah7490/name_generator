import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:name_generator/SRC/Application/Services/database_service.dart';
import 'package:name_generator/SRC/Domain/Models/blog.dart';
import 'package:name_generator/SRC/Domain/Models/category.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/locator.dart';
import 'SRC/Presentation/Resources/app_providers.dart';
import 'SRC/Presentation/Widgets/Splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
        
    apiKey: "AIzaSyBVeMW8zlHpaRL70B0Wy3KG3NeKyOqlays",
    appId: "1:608984517534:android:b32aa954d3ae1d0601648f",
    messagingSenderId: "608984517534",
    projectId: "name-generator-1ca2e",
  ));

  await setupLocator();

   final _db = locator<DatabaseService>();


  runApp(MultiBlocProvider(providers: appProviders, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Name Generator',
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            brightness: Brightness.light, // Set the default brightness to light
          ),

          themeMode:
              ThemeMode.system, // Use the system theme mode (light or dark)
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}




// class CustomAutocomplete extends StatelessWidget {
//   final List<String> _options = ['Apple', 'Banana', 'Orange', 'Watermelon'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: Autocomplete<String>(
//         optionsBuilder: (TextEditingValue textEditingValue) {
//           if (textEditingValue.text == '') {
//             return const Iterable<String>.empty();
//           }
//           return _options;
//         },
//         onSelected: (String selection) {
//           debugPrint('You just selected $selection');
//           // Implement additional actions on selection here
//         },
//         fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
//           return TextFormField(
//             controller: textEditingController,
//             focusNode: focusNode,
//             decoration: InputDecoration(
//               labelText: 'Search Fruit',
//               border: OutlineInputBorder(),
//               suffixIcon: Icon(Icons.search),
//             ),
//             onFieldSubmitted: (String value) {
//               onFieldSubmitted();
//             },
//           );
//         },
//         // optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
//         //   return Align(
//         //     alignment: Alignment.topLeft,
//         //     child: Material(
//         //       child: Container(
//         //         width: 300,
//         //         height: 200,
//         //         child: ListView.builder(
//         //           itemCount: options.length,
//         //           itemBuilder: (BuildContext context, int index) {
//         //             final String option = options.elementAt(index);
//         //             return GestureDetector(
//         //               onTap: () {
//         //                 onSelected(option);
//         //               },
//         //               child: ListTile(
//         //                 title: Text(option),
//         //               ),
//         //             );
//         //           },
//         //         ),
//         //       ),
//         //     ),
//         //   );
//         // },
//       ),
//     );
//   }
// }


// // class CustomDropdownFormField extends StatefulWidget {
// //   @override
// //   _CustomDropdownFormFieldState createState() => _CustomDropdownFormFieldState();
// // }

// // class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
// //   final TextEditingController _controller = TextEditingController();
// //   final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();
// //   String? _selectedValue;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Form(
// //         key: _formKey,
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: <Widget>[
           
// //             TextFormField(
// //               controller: _controller,
// //               decoration: InputDecoration(labelText: 'Custom Input'),
// //               validator: (value) {
// //                 if (value!.isEmpty) {
// //                   return 'Please enter some text or select a value';
// //                 }
// //                 return null;
// //               },
              
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 if (_formKey.currentState!.validate()) {
// //                   // Process data.
// //                 }
// //               },
// //               child: Text('Submit'),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

