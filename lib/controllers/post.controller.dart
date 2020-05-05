import 'dart:io';

import 'package:castronet/models/post.model.dart';
import 'package:castronet/models/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
part 'post.controller.g.dart';

class PostController = _PostControllerBase with _$PostController;

abstract class _PostControllerBase with Store {
  @observable
  PostModel post;

  @action
  newPost() {
    String postId = Uuid().v4();

    post = new PostModel(
      postId: postId,
      mediaUrl: "",
      title: "",
      description: "",
    );
  }

  @observable
  bool formVisibility;

  @action
  changeFormVisibility(bool visibility) {
    formVisibility = visibility;
  }

  @observable
  File image;

  @action
  resetImage() {
    image = null;
  }

  @action
  setImage(File file) {
    image = file;
  }

  @observable
  bool uploadingPost;

  @action
  setUploadPostStatus(bool status) {
    uploadingPost = status;
  }

  Future<void> uploadImage() async {
    final StorageReference storageRef = FirebaseStorage.instance.ref();

    StorageUploadTask uploadTask =
        storageRef.child("post_${post.postId}.jpg").putFile(image);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    post.mediaUrl = await storageSnap.ref.getDownloadURL();
    return;
  }

  @action
  createPostInFirestore(
      UserModel user, String title, String description) async {
    await uploadImage();

    final postsRef = Firestore.instance.collection('posts');

    await postsRef
        .document(user.id)
        .collection("userPosts")
        .document(this.post.postId)
        .setData({
      "postId": post.postId,
      "ownerId": user.id,
      "username": user.username,
      "mediaUrl": post.mediaUrl,
      "title": title,
      "description": description,
      "active": true,
      "createAt": DateTime.now()
    });
  }

  @action
  updatePostInFirestore(userId, postId, title, description) async {
    final postsRef = Firestore.instance.collection('posts');

    await postsRef
        .document(userId)
        .collection("userPosts")
        .document(postId)
        .updateData({
      "title": title,
      "description": description,
    });
  }

  @action
  deletePostInFirestore(userId, postId) async {
    final postsRef = Firestore.instance.collection('posts');

    await postsRef
        .document(userId)
        .collection("userPosts")
        .document(postId)
        .updateData({"active": false});
  }
}
