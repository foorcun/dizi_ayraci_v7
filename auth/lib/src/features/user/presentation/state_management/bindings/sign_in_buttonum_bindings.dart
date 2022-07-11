import 'package:auth/auth.dart';
import 'package:auth/src/features/user/presentation/state_management/user_service.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import '/src/injection_container.dart' as di;

class SignInButtonumBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<UserController>(UserController());
  }
}
