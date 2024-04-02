import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppUser {
  String? email;
  String? password;
  String? name;
  String? image;
  String? id;

  AppUser({
    this.email,
    this.password,
    this.name,
    this.id,
  });

  AppUser.fromJson(json, id) {
    this.id = id;
    this.name = json['name'];
    this.image = json['image'];
    this.email = json['email'];
  }

  toJson() => {
        'image': this.image,
        'email': this.email,
        'name': this.name,
      };
}
