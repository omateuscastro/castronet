import 'package:castronet/models/post.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String username;
  String displayName;
  String photoUrl;
  String email;
  String bio;
  DateTime updateAt;
  int postCount;
  List<PostModel> posts;

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
