import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class Api {
  static get SharedPrefs => null;

  static Map<String, String> _authMiddleWare() {
    String? us = SharedPrefs.getUserToken();
    print(us);
    return us != null
        ? {
      "Authorization": "Bearer $us",

    }
        : {
      'Content-Type': 'application/json',
    };
  }

  static Future<Map<String, dynamic>> get(String url,
      {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.get(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }
      return {"success": false, "error": res.body, "body": null};
    } catch (e) {
      rethrow;
    }
  }




  static Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body,
      {Map<String, String>? header}) async {

    try
    {


      http.Response res = await http.post(
        Uri.parse(url),
        headers: header ?? _authMiddleWare(),
        body: (body),
      );
      print("Response ${res.body}");
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": res.body
      };
    } on SocketException catch (e) {

      return {
        "success": false,
        "error": 'No Internet Please Connect To Internet',
        "status": 30
      };


    } on TimeoutException catch (e) {
      print('in timeout');
      // Handle SocketException here.
      return {
        "success": false,
        "error":
        "Oops! We're experiencing technical difficulties at the moment. Our servers are currently not responding. Please try again later.",
        "status": 31
      };
    } on HttpException catch (e) {
      // Handle HttpException (e.g., invalid URL) here.
      return {
        "success": false,
        "error":
        "Oops! We're experiencing technical difficulties at the moment. Our servers are currently not responding. Please try again later.",
        "status": 32
      };
    } catch (e) {
      return Future.error(e);
    }
  }




  static Future<Map<String, dynamic>> put(
      String url, Map<String, dynamic>? body,
      {Map<String, String>? headers}) async {
    try {
      //print(body);
      http.Response res = await http.put(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
        body: jsonEncode(body),
        //encoding: Encoding.getByName("application/x-www-form-urlencoded")
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }



  static Future<Map<String, dynamic>> delete(String url, String id,
      {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.delete(
        Uri.parse("$url/$id"),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }
      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }
}
