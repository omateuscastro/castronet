import 'package:castronet/models/user.model.dart';
import 'package:castronet/services/auth.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'user.controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  @observable
  UserModel currentUser;

  @action
  getCurrentUserData() async {
    final FirebaseUser currentFirebaseUser = await auth.currentUser();
    final usersRef = Firestore.instance.collection('users');
    DocumentSnapshot doc =
        await usersRef.document(currentFirebaseUser.uid).get();
    currentUser = UserModel.fromDocument(doc);
  }

  @action
  saveNewUserData(String username) async {
    final FirebaseUser currentFirebaseUser = await auth.currentUser();
    final usersRef = Firestore.instance.collection('users');

    var data = {
      "id": currentFirebaseUser.uid,
      "username": username,
      "photoUrl": currentFirebaseUser.photoUrl,
      "displayName": currentFirebaseUser.displayName,
      "email": currentFirebaseUser.email,
      "bio": "",
      "updateAt": DateTime.now()
    };

    usersRef.document(currentFirebaseUser.uid).setData(data);

    DocumentSnapshot doc =
        await usersRef.document(currentFirebaseUser.uid).get();

    currentUser = UserModel.fromDocument(doc);
    return;
  }
}
