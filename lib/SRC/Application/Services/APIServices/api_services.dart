import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'http://192.168.1.22:5000';

  static Future<Map<String, dynamic>> Post(
      Map<String, dynamic> body, String url, Map<String, String>? headers) async {
    print('body values in API-SERVICES: $body');
    print('$baseUrl/$url');
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request('POST', Uri.parse('$baseUrl/$url'));
      request.body = json.encode(body);
      if (headers != null) {
        request.headers.addAll(headers);
      }

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return json.decode(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
        throw Exception('Failed to post data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}









// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
//
// class Api {
//   static final String baseUrl = 'http://192.168.1.22:5000';
//   static Future<Map<String, dynamic>> Post (
//       Map<String, dynamic> body , String url, Map<String, String>?header) async {
//     print('body values in API-SERVICES: $body');
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/$url'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(body),
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print(response.body);
//          Map<String, dynamic> result =  jsonDecode(response.body);
//         return result;
//       }
//       return {
//         "success": false,
//         "error": "${response.statusCode} ${response.reasonPhrase}",
//         "body":response.body,
//       };
//     } catch (e) {
//       return Future.error(e);
//     }
//   }
// }
//
//






