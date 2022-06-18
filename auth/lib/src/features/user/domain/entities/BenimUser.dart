import 'package:firebase_auth/firebase_auth.dart';

import '../../data/datasource/auth_strateji.dart';

// class BenimUser extends User {
class BenimUser {
  // User? user;
  AuthStrateji? authStrateji;

  UserCredential? userCredential;

  // User({
  //   required this.userName,
  // });

  BenimUser();

  BenimUser.withCredential(UserCredential userCred) {
    userCredential = userCred;
  }

  BenimUser.withAuthStrateji(AuthStrateji authStrateji) {
    this.authStrateji = authStrateji;
  }

  // userSignIn() async {
  //   userCredential = await authStrateji!.signIn();
  // }

  // bringThisUser() {
  //   return this;
  // }

  // get authStrateji => _authStrateji;

  String getUid() {
    return userCredential!.user!.uid;
  }

  String? getEmail() {
    return userCredential!.user!.email;
  }

  Future<void> signOut() async {
    await authStrateji!.signOut();
  }

  setUserCredential(UserCredential userCredential) {
    this.userCredential = userCredential;
  }

  setAuthStrateji(AuthStrateji authStrateji) {
    this.authStrateji = authStrateji;
  }

  @override
  String toString() =>
      'BenimUser( authStrateji: $authStrateji, userCredential: $userCredential)';
}
