import 'package:auth/auth.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class SignInButtonumBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<UserController>(UserController());
  }
}
