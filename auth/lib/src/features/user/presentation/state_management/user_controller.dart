import 'package:auth/auth.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';
import '../../data/datasource/auth_strateji.dart';
import '../../domain/entities/BenimUser.dart';
import 'user_service.dart';
import '../../../../main_presentation/homepage.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var myUser = BenimUser().obs;
  // var homePage = const HomePage();
  var homePage = MainPresentationHelper.homePage;

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
