import 'package:auth/auth.dart';
import 'package:auth/src/features/user/presentation/state_management/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    print("login bindings calisiyor");

    Get.put<LoginController>(LoginController());
    Get.put<UserController>(UserController());
  }
}
