import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failure.dart';
import 'package:dizi_ayraci_v7/core/error/success.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/presentation/state_management/service/dizi_service.dart';
import 'package:get/get.dart';

class DiziController extends GetxController {
  final diziler = <Dizi>[].obs;

  final isSuccess = true.obs;
  final failureMessage = "".obs;

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

  Future<Either<Failure, List<Dizi>>> fetchDiziler() async {
    var d = await DiziService().getAllDizi();
    print("ddd " + d.toString());

    // if (d.isRight()) {
    //   diziler.assignAll(d as List<Dizi>);
    //   return d;
    // } else if (d.isLeft()) {
    //   return d;
    // }

    d.fold((l) {
      if (l.failureMessage != null) {
        failureMessage.value = l.failureMessage!;
      }

      // failureMessage.value = l.failureMessage;
      return isSuccess.value = false;
    }, (r) {
      isSuccess.value = true;
      diziler.assignAll(r);
      return r;
    });

    return d;

    // d.isRight(diziler.assignAll(d));

    // if (Right<Failure, List<Dizi>> == d) {}
  }
}
