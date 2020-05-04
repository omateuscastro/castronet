// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostController on _PostControllerBase, Store {
  final _$postAtom = Atom(name: '_PostControllerBase.post');

  @override
  PostModel get post {
    _$postAtom.context.enforceReadPolicy(_$postAtom);
    _$postAtom.reportObserved();
    return super.post;
  }

  @override
  set post(PostModel value) {
    _$postAtom.context.conditionallyRunInAction(() {
      super.post = value;
      _$postAtom.reportChanged();
    }, _$postAtom, name: '${_$postAtom.name}_set');
  }

  final _$formVisibilityAtom = Atom(name: '_PostControllerBase.formVisibility');

  @override
  bool get formVisibility {
    _$formVisibilityAtom.context.enforceReadPolicy(_$formVisibilityAtom);
    _$formVisibilityAtom.reportObserved();
    return super.formVisibility;
  }

  @override
  set formVisibility(bool value) {
    _$formVisibilityAtom.context.conditionallyRunInAction(() {
      super.formVisibility = value;
      _$formVisibilityAtom.reportChanged();
    }, _$formVisibilityAtom, name: '${_$formVisibilityAtom.name}_set');
  }

  final _$imageAtom = Atom(name: '_PostControllerBase.image');

  @override
  File get image {
    _$imageAtom.context.enforceReadPolicy(_$imageAtom);
    _$imageAtom.reportObserved();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.context.conditionallyRunInAction(() {
      super.image = value;
      _$imageAtom.reportChanged();
    }, _$imageAtom, name: '${_$imageAtom.name}_set');
  }

  final _$uploadingPostAtom = Atom(name: '_PostControllerBase.uploadingPost');

  @override
  bool get uploadingPost {
    _$uploadingPostAtom.context.enforceReadPolicy(_$uploadingPostAtom);
    _$uploadingPostAtom.reportObserved();
    return super.uploadingPost;
  }

  @override
  set uploadingPost(bool value) {
    _$uploadingPostAtom.context.conditionallyRunInAction(() {
      super.uploadingPost = value;
      _$uploadingPostAtom.reportChanged();
    }, _$uploadingPostAtom, name: '${_$uploadingPostAtom.name}_set');
  }

  final _$createPostInFirestoreAsyncAction =
      AsyncAction('createPostInFirestore');

  @override
  Future createPostInFirestore(
      UserModel user, String title, String description) {
    return _$createPostInFirestoreAsyncAction
        .run(() => super.createPostInFirestore(user, title, description));
  }

  final _$_PostControllerBaseActionController =
      ActionController(name: '_PostControllerBase');

  @override
  dynamic newPost() {
    final _$actionInfo = _$_PostControllerBaseActionController.startAction();
    try {
      return super.newPost();
    } finally {
      _$_PostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFormVisibility(bool visibility) {
    final _$actionInfo = _$_PostControllerBaseActionController.startAction();
    try {
      return super.changeFormVisibility(visibility);
    } finally {
      _$_PostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetImage() {
    final _$actionInfo = _$_PostControllerBaseActionController.startAction();
    try {
      return super.resetImage();
    } finally {
      _$_PostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImage(File file) {
    final _$actionInfo = _$_PostControllerBaseActionController.startAction();
    try {
      return super.setImage(file);
    } finally {
      _$_PostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUploadPostStatus(bool status) {
    final _$actionInfo = _$_PostControllerBaseActionController.startAction();
    try {
      return super.setUploadPostStatus(status);
    } finally {
      _$_PostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'post: ${post.toString()},formVisibility: ${formVisibility.toString()},image: ${image.toString()},uploadingPost: ${uploadingPost.toString()}';
    return '{$string}';
  }
}
