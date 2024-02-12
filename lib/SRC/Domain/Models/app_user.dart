import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppUser {
  String? email;
  String? password;
  String? name;
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
    this.email = json['email'];
  }

  toJson() => {
        'email': this.email,
        'name': this.name,
      };
}
