import 'package:auth/src/features/user/presentation/state_management/user_controller.dart';
import 'package:auth/src/features/user/presentation/state_management/views/home_view.dart';
import 'package:auth/src/features/user/presentation/state_management/views/login_view.dart';
import 'package:auth/src/features/user/presentation/state_management/views/welcome_view.dart';
import 'package:get/get.dart';

import '../features/user/presentation/plain/plain_sign_in.dart';
import 'homepage.dart';
import 'package:flutter/cupertino.dart';

class MainPresentationHelper {
  // static Widget homePage = HomePage();
  static Widget _plainSignIn = PlainSignIn();
  static Widget homeView = HomeView();
  static Widget loginView = LoginView();
  static Widget welcomeView = WelcomeView();

  // static Widget getPlainSignIn() {
  //   if (Get.find<UserController>().myUser.value.firebaseUser != null) {
  //     // return homePage;
  //   } else {
  //     return _plainSignIn;
  //   }
  // }

  static getHomeView() {
    return homeView;
  }

  static getLogin() {
    return loginView;
  }

  static getWelcome() {
    return welcomeView;
  }
}
