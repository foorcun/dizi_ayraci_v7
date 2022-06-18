import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';
import '../../../../core/singlelar/singlelar.dart';
import '../../domain/entities/BenimUser.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStrateji {
  final firebaseAuth = FirebaseAuth.instance;

  // Future<UserCredential> signIn() async {
  //   throw UnimplementedError();
  // }

  // Future<UserCredential> signIn();

  Future<Either<Failure, BenimUser>> signIn(AuthStrateji authStrateji);

  // Future<UserCredential> signInAnonymously() async {
  //   final userC = await _firebaseAuth.signInAnonymously();

  //   await girisSayisiArttir(userC);

  //   return userC;
  // }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   UserCredential userC =
  //       await FirebaseAuth.instance.signInWithCredential(credential);

  //   return userC;
  // }

  // Future<void> signOut() async {
  //   // await firebaseAuth.signOut();

  //   // await GoogleSignIn().signOut();
  // }

  Future<Either<Failure, Success>> signOut();

  Future<Map<String, dynamic>?> girisSayisi(
      UserCredential girilenUserCredential) async {
    var v = await fireStore
        .collection("users")
        // .doc(girilenUserCredential.user!.uid)
        .doc(myUser.getUid())
        .get();

    var data = v.data();

    print("myUser.getUid() " + myUser.getUid());
    if (data == null) {
      await fireStore
          .collection("users")
          // .doc(girilenUserCredential.user!.uid)
          .doc(myUser.getUid())
          .set({"uid": myUser.getUid(), "girisSayisi": 0});
    }
    print("girisSayisi map dataa " + data.toString());

    return data;
  }

  Future<void> girisSayisiArttir(UserCredential girilenUserCredential) async {
    // var v = await fireStore.collection("users").doc(myUser.getUid()).get();
    var v = await fireStore
        .collection("users")
        .doc(girilenUserCredential.user!.uid)
        .get();

    var data = v.data();
    print("girisSayisi map data " + data.toString());

    // print("myUser.getUid() " + girilenUserCredential.user!.uid);
    print("girilenUserCredential.user!.uid " + girilenUserCredential.user!.uid);
    if (data == null) {
      await fireStore
          .collection("users")
          // .doc(girilenUserCredential.user!.uid)
          .doc(girilenUserCredential.user!.uid)
          .set({"uid": girilenUserCredential.user!.uid, "girisSayisi": 1});
    } else {
      print("girisSayisi map data " + data.toString());

      await fireStore
          .collection("users")
          .doc(girilenUserCredential.user!.uid)
          .update({"girisSayisi": (data["girisSayisi"] + 1)});
    }
    print("girisSayisi map dataa " + data.toString());
  }
}
