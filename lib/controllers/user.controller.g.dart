// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading =>
      (_$loadingComputed ??= Computed<bool>(() => super.loading)).value;

  final _$currentUserAtom = Atom(name: '_UserControllerBase.currentUser');

  @override
  UserModel get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$_loadingAtom = Atom(name: '_UserControllerBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.context.enforceReadPolicy(_$_loadingAtom);
    _$_loadingAtom.reportObserved();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.context.conditionallyRunInAction(() {
      super._loading = value;
      _$_loadingAtom.reportChanged();
    }, _$_loadingAtom, name: '${_$_loadingAtom.name}_set');
  }

  final _$getCurrentUserDataAsyncAction = AsyncAction('getCurrentUserData');

  @override
  Future getCurrentUserData() {
    return _$getCurrentUserDataAsyncAction
        .run(() => super.getCurrentUserData());
  }

  final _$saveNewUserDataAsyncAction = AsyncAction('saveNewUserData');

  @override
  Future saveNewUserData(String username) {
    return _$saveNewUserDataAsyncAction
        .run(() => super.saveNewUserData(username));
  }

  final _$updateProfileDataAsyncAction = AsyncAction('updateProfileData');

  @override
  Future updateProfileData(UserModel user) {
    return _$updateProfileDataAsyncAction
        .run(() => super.updateProfileData(user));
  }

  @override
  String toString() {
    final string =
        'currentUser: ${currentUser.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
