import '../../data/datasource/auth_google_sign_in_strateji.dart';
import '../state_management/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

class SignInButtonum extends StatelessWidget {
  const SignInButtonum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.Google,
      text: "Google ile giriş yapın..",
      onPressed: () async {
        print("basıldı..");
        var response =
            await Get.find<UserController>().signIn(AuthGoogleSingInStrateji());
        print(response);
        response.fold(
            (l) => null,
            (r) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Get.find<UserController>().homePage),
                ));
        // await userController.myUser.value
        //     .setAuthStrateji(AuthGoogleSingInStrateji());
        // print(userController.myUser.value.authStrateji.toString());
        // await userController.myUser.value.userSignIn();
        // // userController.myUser.value.user = fireAuth.currentUser;
        // userController.getFirebaseUser().value = fireAuth.currentUser;
        // print("firebaseuser " + fireAuth.currentUser!.email.toString());
        // // print(userController.myUser.value.getEmail());
        // // Get.off(HomePage());
        // print(userController.getFirebaseUser().value!.email);
        // Get.offNamed("/ScannerResponsive");
      },
    );
  }
}
