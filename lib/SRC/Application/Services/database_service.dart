

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Domain/Models/app_user.dart';
import 'package:name_generator/SRC/Domain/Models/banners.dart';

class DatabaseService{
 final _db = FirebaseFirestore.instance;

   checkUser(AppUser user) async {
    //Todo: Rename getUsers -> getUser
    debugPrint('@getAppUser: id: ${user.id}');
    try {
      final snapshot = await _db.collection('app_user').doc(user.id).get();
      if (snapshot.exists) {
        return true;
      } else {
        return false;
      }
    } catch (e, s) {
      debugPrint('Exception @DatabaseService/getAppUser');
      debugPrint(s.toString());
      return false;
    }
  }

  /// Register app user
  registerAppUser(AppUser user) async {
    debugPrint("User @Id => ${user.id}");
    try {
      await _db
          .collection('app_user')
          .doc(user.id)
          .set(user.toJson())
          .then((value) => debugPrint('user registered successfully'));
    } catch (e, s) {
      debugPrint('Exception @DatabaseService/registerAppUser');
      debugPrint(s.toString());
      return false;
    }
  }

  /// Get User from database using this funciton
  Future<AppUser> getAppUser(id) async {
    //Todo: Rename getUsers -> getUser
    debugPrint('@getAppUser: id: $id');
    try {
      final snapshot = await _db.collection('app_user').doc(id).get();
      debugPrint('Client Data: ${snapshot.data()}');
      return AppUser.fromJson(snapshot.data()!, snapshot.id);
    } catch (e, s) {
      debugPrint('Exception @DatabaseService/getAppUser');
      debugPrint(s.toString());
      return AppUser();
    }
  }


    ///
  /// ==================== APP BANNERS =================== ////
  ///
  ///
  /// Get all banners
  ///
  Future<List<Banners>> getBanners() async {
    debugPrint('@gettingBanners====>');
    final List<Banners> banners = [];
    try {
      final snapshot = await _db
          .collection("banners")
          // .orderBy('createdAt', descending: true)
          .get();
      debugPrint('banners => ${snapshot.docs.length}');
      if (snapshot.docs.isNotEmpty) {
        
        for (var doc in snapshot.docs) {
          banners.add(Banners.formJson(doc, doc.id));
        }
      }
    } catch (e) {
      debugPrint('Exception @DatabaseService/gettingBanner $e');
    }
    return banners;
  }

}