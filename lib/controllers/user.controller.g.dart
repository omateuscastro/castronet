// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
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

  final _$saveNewUserDataAsyncAction = AsyncAction('saveNewUserData');

  @override
  Future saveNewUserData(String username) {
    return _$saveNewUserDataAsyncAction
        .run(() => super.saveNewUserData(username));
  }

  @override
  String toString() {
    final string = 'currentUser: ${currentUser.toString()}';
    return '{$string}';
  }
}
