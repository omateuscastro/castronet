import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String id;
  String mediaUrl;
  String title;
  String description;
  String ownerId;
  String username;
  dynamic likes;
  int likesCount;

  PostModel({
    this.id,
    this.mediaUrl,
    this.title,
    this.description,
    this.ownerId,
    this.username,
    this.likes,
  });

  factory PostModel.fromDocument(DocumentSnapshot doc) {
    return PostModel(
      id: doc['id'],
      mediaUrl: doc['mediaUrl'],
      title: doc['title'],
      description: doc['description'],
      ownerId: doc['ownerId'],
      username: doc['username'],
      likes: doc['likes'],
    );
  }
}
