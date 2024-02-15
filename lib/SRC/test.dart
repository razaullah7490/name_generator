// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';

// class TestApi extends StatefulWidget {
//   const TestApi({super.key});

//   @override
//   State<TestApi> createState() => _TestApiState();
// }

// class _TestApiState extends State<TestApi> {
//   late final TextEditingController promtController;
//   String responseTxt = "";
//   late ResponseModel _responseModel;
//   @override
//   void initState() {
//     promtController = TextEditingController();
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   void dispose() {
//     promtController.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ChatGPT'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           TextFormField(
//             controller: promtController,
//             decoration: InputDecoration(
//               suffixIcon: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       completionFun();
//                     });
//                   },
//                   icon: Icon(Icons.send)),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   completionFun() async {
//     setState(() {
//       responseTxt = 'Loading....';
//     });
//     debugPrint(responseTxt);
//     final response =
//         await http.post(Uri.parse('https://api.openai.com/v1/completions'),
//             headers: {
//               'Content-Type': 'application/json',
//               'Authorization': 'Bearer ${dotenv.env['token']}'
//             },
//             body: jsonEncode({
//               "model": 'gpt-3.5-turbo-instruct',
//               "prompt": promtController.text,
//               "max_tokens": 250,
//               "temperature": 0,
//               "top_p": 1
//             }));
//     debugPrint(response.body);
//     setState(() {
//       _responseModel = ResponseModel.fromJson(response.body);
//       responseTxt = _responseModel.choices[0]['text'];
//       debugPrint(responseTxt);
//     });
//   }
// }

// class ResponseModel {
//   final String id;
//   final String object;
//   final String model;
//   final List choices;

//   ResponseModel(
//     this.id,
//     this.object,
//     this.model,
//     this.choices,
//   );

//   ResponseModel copyWith({
//     String? id,
//     String? object,
//     String? model,
//     List? choices,
//   }) {
//     return ResponseModel(
//       id ?? this.id,
//       object ?? this.object,
//       model ?? this.model,
//       choices ?? this.choices,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'object': object,
//       'model': model,
//       'choices': choices,
//     };
//   }

//   factory ResponseModel.fromMap(Map<String, dynamic> map) {
//     return ResponseModel(
//       map['id'] as String,
//       map['object'] as String,
//       map['model'] as String,
//       List.from(
//         (map['choices'] as List),
//       ),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ResponseModel.fromJson(String source) =>
//       ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'ResponseModel(id: $id, object: $object, model: $model, choices: $choices)';
//   }

//   @override
//   bool operator ==(covariant ResponseModel other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.object == object &&
//         other.model == model &&
//         listEquals(other.choices, choices);
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^ object.hashCode ^ model.hashCode ^ choices.hashCode;
//   }
// }
