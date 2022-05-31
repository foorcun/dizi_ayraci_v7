import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/presentation/state_management/service/dizi_service.dart';
import 'package:get/get.dart';

class DiziController extends GetxController {
  final diziler = <Dizi>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit

    fetchDiziler();
    // print("diziler değer " + diziler.value.toString());
    // diziler.bindStream(HttpDiziDB().getAllDizi());

    // ever(qr, (_) {
    //   secilenRestoran
    //       .bindStream(FirebaseRestoranDB().findRestoranByUid(qr.value));
    // });
    // print("DiziController");
    super.onInit();
  }

  Future<void> fetchDiziler() async {
    var d = await DiziService().getAllDizi();
    print("ddd " + d.toString());
    diziler.assignAll(d);
  }
}
