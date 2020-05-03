import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String username;
  String displayName;
  String photoUrl;
  String email;
  String bio;
  DateTime updateAt;

  UserModel({
    this.id,
    this.username,
    this.displayName,
    this.photoUrl,
    this.email,
    this.bio,
    this.updateAt,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      id: doc['id'],
      username: doc['username'],
      displayName: doc['displayName'],
      photoUrl: doc['photoUrl'],
      email: doc['email'],
      bio: doc['bio'],
    );
  }
}
