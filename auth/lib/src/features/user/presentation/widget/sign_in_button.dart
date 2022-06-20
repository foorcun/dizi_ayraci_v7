import 'package:auth/src/features/user/presentation/state_management/controllers/sign_in_buttonum_controller.dart';

import '../../data/datasource/auth_google_sign_in_strateji.dart';
import '../state_management/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

class SignInButtonum extends GetView<SignInButtonumController> {
  SignInButtonum({Key? key}) : super(key: key);

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
        // response.fold((l) => null, (r) {
        //   Get.off(Get.find<UserController>().homePage);
        // });
      },
    );
  }
}
