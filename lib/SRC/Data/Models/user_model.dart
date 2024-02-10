import 'package:name_generator/SRC/Domain/Entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    final String? name,
    final String? email,
    final String? uid,
    final String? status,
    final String? password,
  }) : super(
            uid: uid,
            name: name,
            email: email,
            password: password,
            status: status);

  factory UserModel.fromSnapshot(documentSnapshot) {
    return UserModel(
      status: documentSnapshot.get('status'),
      name: documentSnapshot.get('name'),
      uid: documentSnapshot.get('uid'),
      email: documentSnapshot.get('email'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {"status": status, "uid": uid, "email": email, "name": name};
  }
}
