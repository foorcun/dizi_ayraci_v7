import 'package:auth/auth.dart';
import 'package:auth/src/core/singlelar/singlelar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';
import '../../data/datasource/auth_strateji.dart';
import '../../domain/entities/BenimUser.dart';
import 'user_service.dart';
import '../../../../main_presentation/homepage.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<BenimUser> myUser = BenimUser().obs;

  late Rx<User?> _firebaseUser;

  // var homePage = const HomePage();
  var homePage = MainPresentationHelper.homePage;

  @override
  void onReady() {
    // myUser.bindStream(_auth.o)
    // myUser.value.user = Rx<User?>(fireAuth.currentUser);
    // myUser.value.user!.bindStream(fireAuth.userChanges());
    // ever(myUser.value.user, _setInitialScreen);
    print("user controller onReady()");
    // firebaseUser = Rx<User?>(fireAuth.currentUser);
    setFirebaseUser(Rx<User?>(fireAuth.currentUser));
    // _firebaseUser.bindStream(fireAuth.userChanges());
    _firebaseUser.bindStream(fireAuth.userChanges());
    ever(_firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    myUser.value.firebaseUser = user;
    if (user != null) {
      // Get.offAll(ScannerResponsive()); //! giris sonrasi başlangıç screen sec
      //!   off kullanirken dikkatli olmak lazm : https://www.youtube.com/watch?v=qmmw6OEP0CU&ab_channel=dbestech

      Get.offAll(MainPresentationHelper
          .homePage); //! giris sonrasi başlangıç screen sec
      print(user);

      print(user);
    } else {
      // Get.offAll(GoogleSignInButton()); //! başlangıç screen sec
      // setSignInPage(SignInView());
      //!   off kullanirken dikkatli olmak lazm : https://www.youtube.com/watch?v=qmmw6OEP0CU&ab_channel=dbestech
      Get.offAll(
          MainPresentationHelper.getPlainSignIn()); //! başlangıç screen sec
    }
  }

  setFirebaseUser(Rx<User?> user) {
    _firebaseUser = user;
  }

  Rx<User?> getFirebaseUser() {
    // if (_firebaseUser.value == null) {
    //   //!
    //   setFirebaseUser(Rx<User?>(fireAuth.currentUser));
    // }
    return _firebaseUser;
  }

  Future<Either<Failure, Success>> signIn(AuthStrateji authStrateji) async {
    // var userCredential = await AuthGoogleSingInStrateji().signIn();
    // myUser.value.setUserCredential(userCredential);

    var response = await UserService().signIn(authStrateji);

    try {
      // var userCredential = await AuthGoogleSingInStrateji().signIn();
      var state = 0; // 0 ise failure , 1 ise succesa
      Failure ll = GeneralSignInFailure();
      response.fold((l) {
        state = 0;
        ll = l;
      }, (r) {
        print("benim user");
        myUser.value = r;
        print(r.toString());
        state = 1;
      });

      if (state == 0) {
        return Left(ll);
      } else {
        return Right(SignInSuccess());
      }
    } catch (e) {
      return Left(GeneralSignInFailure());
    }
    // return Right(SignInSuccess());

    // return Left(GeneralSignInFailure());
  }
}
