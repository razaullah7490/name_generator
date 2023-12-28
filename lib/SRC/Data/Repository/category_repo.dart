import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:name_generator/SRC/Application/Services/APIServices/api_services.dart';

//
// class CatRepo {
//   Future<dynamic> getProduct(url) async {
//     try {
//
//       print(url);
//       return await Api.post(url).then((value) {
//         if (kDebugMode) {
//           print("P Response $value");
//         }
//         if (value.runtimeType != int && value.runtimeType == String) {
//           return jsonDecode();
//         } else {
//           return value;
//         }
//       }).catchError((e) {
//         throw e;
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
