class Categories {
  String? id;
  String? imageUrl;
  DateTime? createdAt;
  String? name;

  Categories({this.id, this.createdAt, this.imageUrl, this.name});

  Categories.fromJson(json, this.id) {
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'].toDate() ?? DateTime.now();
    name = json['name'];
  }


  toJson(){
   return{
     'imageUrl' :imageUrl,
     'createdAt': createdAt,
      'name': name,
    
   };
  }
}
