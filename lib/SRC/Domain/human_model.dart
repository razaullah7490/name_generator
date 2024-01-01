class Human {
  final String generatedInfo;
  final String name;
  final String history;

  Human({
    required this.generatedInfo,
    required this.name,
    required this.history,
  });

  factory Human.fromJson(Map<String, dynamic> json) {
    return Human(
      generatedInfo: json['generated_info'] ?? '',
      name: json['name'] ?? '',
      history: json['history'] ?? '',
    );
  }
}
