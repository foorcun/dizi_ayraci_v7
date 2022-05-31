import 'package:dizi_ayraci_v7/features/dizi/presentation/state_management/controller/dizi_controller.dart';
import 'package:get/get.dart';

class AllDiziBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiziController>(() => DiziController());
    // Get.lazyPut<SezonController>(() => SezonController());
  }
}
