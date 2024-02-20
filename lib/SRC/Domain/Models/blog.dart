// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:name_generator/SRC/Domain/Models/boolean_form.dart';

class Blog {
  DateTime? createdAt;
  List<String>? Keyword;
  List<String>? targetAudience;
  List<String>? topicOptions;
  String? id;

  //BooleanForm? booleanForm;

  Blog({
  //  this.booleanForm,
    this.id,
    this.createdAt,
    this.Keyword,
    this.targetAudience,
    this.topicOptions,
  });


  Blog.fromJson(json, id) {
    id = this.id;
    
    createdAt = json['createdAt'].toDate() ?? DateTime.now();
    if (json['keyword_phrases_options'] != null) {
      Keyword = [];
      json['keyword_phrases_options'].forEach((e) {
        Keyword!.add(e);
      });
    }
    if (json['target_audience_options'] != null) {
      targetAudience = [];
      json['target_audience_options'].forEach((e) {
        targetAudience!.add(e);
      });
    }

    if (json['topic_options'] != null) {
      topicOptions = [];
      json['topic_options'].forEach((e) {
        topicOptions!.add(e);
      });
    }
  }
}
