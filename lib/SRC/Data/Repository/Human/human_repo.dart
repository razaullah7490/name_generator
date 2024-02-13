
import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../../Application/api_services.dart';
import '../../../Domain/human_model.dart';

class HumanRepository {
  static const String url = 'generatehumanname';
  static Future<Map <String, dynamic>> generateHumanName({
    required Map<String, dynamic> data,
  }) async {
    try {
  return  await Api.Post(data, url, {'Content-Type': 'application/json'} ).then((value){
    print(value);
return value;
  } ).catchError((e){
    throw e;
  });
    } catch (e) {
      rethrow;
      print('Error in HumanRepository: $e');
      throw Exception('Failed to generate human name');
    }
  }
}




