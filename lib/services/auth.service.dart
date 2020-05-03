import 'package:castronet/constants/type_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final usersRef = Firestore.instance.collection('users');

Future<TypeAuth> signInWithGoogle() async {
  try {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    bool userExists = await checkUserInFireStore(currentUser.uid);

    return userExists ? TypeAuth.auth : TypeAuth.newUser;
  } catch (e) {
    return TypeAuth.unauth;
  }
}

Future<TypeAuth> signInWithGoogleSilently() async {
  try {
    final GoogleSignInAccount googleSignInAccount =
        await googleSignIn.signInSilently(suppressErrors: false);
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    bool userExists = await checkUserInFireStore(currentUser.uid);

    return userExists ? TypeAuth.auth : TypeAuth.newUser;
  } catch (e) {
    return TypeAuth.unauth;
  }
}

Future<GoogleSignInAccount> signOutGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signOut();

  return googleSignInAccount;
}

Future<bool> checkUserInFireStore(id) async {
  final DocumentSnapshot doc = await usersRef.document(id).get();

  if (!doc.exists) {
    return false;
  }

  return true;
}
