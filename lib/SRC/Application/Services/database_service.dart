import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:name_generator/SRC/Domain/Models/app_user.dart';
import 'package:name_generator/SRC/Domain/Models/banners.dart';
import 'package:name_generator/SRC/Domain/Models/blog.dart';
import 'package:name_generator/SRC/Domain/Models/boolean_form.dart';
import 'package:name_generator/SRC/Domain/Models/category.dart';
import 'package:name_generator/SRC/Domain/Models/form_data.dart';

class DatabaseService {
  BooleanForm? bool;
  FormsDataa? forms;
  final _db = FirebaseFirestore.instance;

  // Blog blog = Blog();
  final List<Blog> blog = [];
  List<Categories>? categories;
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

  ///=============[Category]==========================
  ///

  Future<List<Categories>> getCategories() async {
    debugPrint('@gettingCategories');
    categories = [];
    try {
      final snapshot = await _db
          .collection("category")
          //  .orderBy('createdAt', descending: false)
          .get();

      debugPrint('category => ${snapshot.docs.length}');

      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          print('1');
          categories!.add(Categories.fromJson(doc, doc.id));
          debugPrint('category => ${categories!.length}');
        }
      }
    } catch (e) {
      debugPrint('Exception @DatabaseService/gettingCategories $e');
    }
    return categories!;
  }

  Future<BooleanForm?> getBooleanForm({required String categoryId}) async {
    //  print('Category Id ${categories![0].id!}');
    try {
      final subDocumentSnapshot = await FirebaseFirestore.instance
          .collection('category')
          .doc(categoryId)
          .collection('booleanForm')
          .get();

      if (subDocumentSnapshot.docs.isNotEmpty) {
        bool = BooleanForm.fromJson(
            subDocumentSnapshot.docs.first.data() as Map<String, dynamic>);
        print(bool!.charType);
        return bool;
      } else {
        print("No such subdocument!");
        return null;
      }
    } catch (e) {
      print("Error getting subdocument: $e");
      return null;
    }
  }

  Future<FormsDataa?> getFormData() async {
    try {
      QuerySnapshot snapshot = await _db.collection('FormData').get();

      if (snapshot.docs.isNotEmpty) {
        forms = FormsDataa.fromJson(snapshot.docs.first.data());
        // print(forms!.targetAudienceOptions);
        return forms;
      } else {
        print("No such subdocument!");
        return null;
      }
    } catch (e) {
      print("Error getting subdocument: $e");
      return null;
    }
  }


  // Future<void> addCategoriesToFirebase() async {
  //   // Initialize Firestore
  //   final firestore = FirebaseFirestore.instance;

  //   // List of category data
  //   final categoriesData = [
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2Fblog.png?alt=media&token=2bd14f49-0fa1-4d18-9df8-cdd0548eab76',
  //       'createdAt': DateTime.now(),
  //       'name': 'Blog',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2Fbook.png?alt=media&token=681a6a98-fd66-4afb-817f-c2aae11142f4',
  //       'createdAt': DateTime.now(),
  //       'name': 'Book',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2Fcharacter.png?alt=media&token=e76f7a80-1df2-4fa8-ab6e-f6f1d62ba2c5',
  //       'createdAt': DateTime.now(),
  //       'name': 'Character',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2FGamer.png?alt=media&token=1f877454-0361-4612-9259-162d60cd6a52',
  //       'createdAt': DateTime.now(),
  //       'name': 'Gamer',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2FHuman.png?alt=media&token=d9075f48-e46a-45fe-83d8-47ea69f0fdda',
  //       'createdAt': DateTime.now(),
  //       'name': 'Human',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2Fnick%20name.png?alt=media&token=d3406278-f46c-4f09-b61b-c3d0b360b01a',
  //       'createdAt': DateTime.now(),
  //       'name': 'Nick Name',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2Fpet.png?alt=media&token=1484331d-a746-4934-8c8c-bc1aee082b9c',
  //       'createdAt': DateTime.now(),
  //       'name': 'Pet',
  //     },
  //     {
  //       'imageUrl':
  //           'https://console.firebase.google.com/project/name-generator-1ca2e/storage/name-generator-1ca2e.appspot.com/files/~2Fcategory',
  //       'createdAt': DateTime.now(),
  //       'name': 'Product',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2Fslogan.png?alt=media&token=848e8239-184c-489f-91c8-7df0f40b048f',
  //       'createdAt': DateTime.now(),
  //       'name': 'Slogan',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2Fstartup.png?alt=media&token=c2852039-f013-4b89-84f0-46ebf58adb87',
  //       'createdAt': DateTime.now(),
  //       'name': 'Startup',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2Fstartup.png?alt=media&token=c2852039-f013-4b89-84f0-46ebf58adb87',
  //       'createdAt': DateTime.now(),
  //       'name': 'Startup',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2Fstory.png?alt=media&token=0d7c0810-0ed6-4f25-8c18-d9b83b3779d9',
  //       'createdAt': DateTime.now(),
  //       'name': 'Story',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2FTeam.png?alt=media&token=62742fa1-2983-4171-96b3-0ee1030179e1',
  //       'createdAt': DateTime.now(),
  //       'name': 'Team',
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2FTitle.png?alt=media&token=b7053718-d8ad-4a54-be4a-6dc4b40ff71f',
  //       'createdAt': DateTime.now()
  //     },
  //     {
  //       'imageUrl':
  //           'https://firebasestorage.googleapis.com/v0/b/name-generator-1ca2e.appspot.com/o/category%2Ftwins.png?alt=media&token=d7a3bc1b-8eb3-42e5-92f4-4eb3d8aa66db',
  //       'createdAt': DateTime.now(),
  //       'name': 'Twins',
  //     },
  //   ];

  //   // Loop through the category data and add them to Firebase
  //   for (final categoryData in categoriesData) {
  //     await firestore.collection('category').add(categoryData);
  //   }

  //   print('Categories data added to Firebase successfully!');
  // }

//   Future<void> addBlogFormToFirebase() async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   await firestore.collection('Forms').add(blogForm);
// }

  /// =============================================================

  // Future<void> addBooleanFormDataToFirebase() async {
  //   final firestore = FirebaseFirestore.instance;

  //   for (int i = 0; i < categories!.length; i++) {
  //     await firestore
  //         .collection('category')
  //         .doc(categories![i].id!)
  //         .collection('booleanForm')
  //         .add({
  //       "categoryId": categories![i].id!,
  //       "createdAt": DateTime.now(),
  //       "topic_options": false,
  //       "target_audience_options": false,
  //       "keyword_phrases_options": false,
  //       "theme_options_book": false,
  //       "keyword_options": false,
  //       "tone_options_book": false,
  //       "gender": false,
  //       "region": false,
  //       "name_style": false,
  //       "flavour": false,
  //       "charType": false,
  //       "letter": false,
  //       "type": false,
  //       "cookingStyle": false,
  //       "texture": false,
  //       "taste": false,
  //       "ingredient": false,
  //       "cusineRegion": false,
  //       "nameLength": false,
  //       "gamingNameThemesOptions": false,
  //       "gameOptions": false,
  //       "religion": false,
  //       "country": false,
  //       "personality": false,
  //       "dob": false,
  //       "name": false,
  //       "pet_type": false,
  //       "theme_dog": false,
  //       "product_type_options": false,
  //       "target_audience_optionss": false,
  //       "product_features": false,
  //       "style_or_tone_produ": false,
  //       "pr": false,
  //       "domain_options": false,
  //       "geographic_focus": false,
  //       "theme_story": false,
  //       "element": false,
  //       "mood": false,
  //       "num_members": false,
  //       "theme_team": false,
  //       "title": false,
  //       "typeOfWork": false,
  //       "subject": false,
  //       "keyword_ideas": false,
  //       "tone_style_title": false,
  //       "twinsGender": false,
  //       "naming_style": false,
  //       "background": false
  //     });

  //     print(
  //         'BooleanForm data added to category ${categories![i].id} successfully!');
  //   }

  //   print(
  //       'BooleanForm data added to Firebase in all category collections successfully!');
  // }

//   Future<void> addBooleanFormDataToFirebase() async {
//   // Initialize Firestore
//   final firestore = FirebaseFirestore.instance;

//  // Add BooleanForm data to a subcollection in Firebase
//   await firestore.collection('category').doc(categories![0].id!).collection('booleanForm').doc('formId').set(
//      {
//   "topic_options": false,
//   "target_audience_options": false,
//   "keyword_phrases_options": false,
//   "theme_options_book": false,
//   "keyword_options": false,
//   "tone_options_book": false,
//   "gender": false,
//   "region": false,
//   "name_style": false,
//   "flavour": false,
//   "charType": false,
//   "letter": false,
//   "type": false,
//   "cookingStyle": false,
//   "texture": false,
//   "taste": false,
//   "ingredient": false,
//   "cusineRegion": false,
//   "nameLength": false,
//   "gamingNameThemesOptions": false,
//   "gameOptions": false,
//   "religion": false,
//   "country": false,
//   "personality": false,
//   "dob": false,
//   "name": false,
//   "pet_type": false,
//   "theme_dog": false,
//   "product_type_options": false,
//   "target_audience_optionss": false,
//   "product_features": false,
//   "style_or_tone_produ": false,
//   "pr": false,
//   "domain_options": false,
//   "geographic_focus": false,
//   "theme_story": false,
//   "element": false,
//   "mood": false,
//   "num_members": false,
//   "theme_team": false,
//   "title": false,
//   "typeOfWork": false,
//   "subject": false,
//   "keyword_ideas": false,
//   "tone_style_title": false,
//   "twinsGender": false,
//   "naming_style": false,
//   "background": false
// }
//   );

//   print('BooleanForm data added to Firebase as a subcollection successfully!');
// }
}
