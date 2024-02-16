// ignore_for_file: public_member_api_docs, sort_constructors_first
class Blog {
  DateTime? createdAt;
  List<String>? Keyword;
  List<String>? targetAudience;
  List<String>? topicOptions;
  String? id;

  Blog({
    this.id,
    this.createdAt,
    this.Keyword,
    this.targetAudience,
    this.topicOptions,
  });

  Blog.fromJson(json, id) {
    createdAt = json['createdAt'].toDate() ?? DateTime.now();
    if (json['keyword_phrases'] != null) {
      Keyword = [];
      json['keyword_phrases'].forEach((e) {
        Keyword!.add(e);
      });
    }
    if (json['target_audience'] != null) {
      targetAudience = [];
      json['target_audience'].forEach((e) {
        targetAudience!.add(e);
      });
    }

    if (json['topic_optons'] != null) {
      topicOptions = [];
      json['topic_optons'].forEach((e) {
        topicOptions!.add(e);
      });
    }
  }
}
