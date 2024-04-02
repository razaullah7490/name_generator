class Banners {
  String? id;
  String? imageUrl;
  DateTime? createdAt;

  Banners({
    this.id,
    this.imageUrl,
    this.createdAt,
  });

  Banners.formJson(json, this.id) {
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'].toDate() ?? DateTime.now();
  }

  toJson() {
    return {
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }
}
