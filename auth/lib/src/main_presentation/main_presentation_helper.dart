import 'package:auth/src/features/user/presentation/state_management/user_controller.dart';
import 'package:get/get.dart';

import '../features/user/presentation/plain/plain_sign_in.dart';
import 'homepage.dart';
import 'package:flutter/cupertino.dart';

class MainPresentationHelper {
  static Widget homePage = HomePage();
  static Widget _plainSignIn = PlainSignIn();

  static Widget getPlainSignIn() {
    if (Get.find<UserController>().myUser.value.firebaseUser != null) {
      return homePage;
    } else {
      return _plainSignIn;
    }
  }
}
