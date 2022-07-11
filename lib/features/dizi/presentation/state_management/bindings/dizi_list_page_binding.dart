import 'package:auth/auth.dart';
import 'package:dizi_ayraci_v7/features/dizi/presentation/state_management/controller/dizi_controller.dart';
import 'package:get/get.dart';

class DiziListPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<UserController>(UserController());
    Get.put<DiziController>(DiziController());
  }
}
