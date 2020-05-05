import 'package:castronet/models/user.model.dart';
import 'package:castronet/services/auth.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'user.controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final usersRef = Firestore.instance.collection('users');

  @observable
  UserModel currentUser;

  @action
  getCurrentUserData() async {
    this._loading = false;

    final FirebaseUser currentFirebaseUser = await auth.currentUser();
    DocumentSnapshot doc =
        await usersRef.document(currentFirebaseUser.uid).get();
    currentUser = UserModel.fromDocument(doc);
    this._loading = true;
    return currentUser;
  }

  @action
  saveNewUserData(String username) async {
    final FirebaseUser currentFirebaseUser = await auth.currentUser();

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

  @action
  updateProfileData(UserModel user) async {
    return usersRef.document(user.id).updateData({
      "displayName": user.displayName,
      "email": user.email,
      "bio": user.bio,
    });
  }

  @observable
  bool _loading;

  @computed
  bool get loading => _loading;
}
