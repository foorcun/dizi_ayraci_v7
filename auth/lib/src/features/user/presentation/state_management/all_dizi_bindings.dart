import 'user_controller.dart';
import 'package:get/get.dart';

class AllUserBindings extends Bindings {
  @override
  void dependencies() {
    print("Get.lazyPut<UserController>(() => UserController()); cagirildi");
    Get.lazyPut<UserController>(() => UserController());
    // Get.lazyPut<SezonController>(() => SezonController());
  }
}
