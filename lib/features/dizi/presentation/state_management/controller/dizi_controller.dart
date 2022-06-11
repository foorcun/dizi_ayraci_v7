import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failure.dart';
import 'package:dizi_ayraci_v7/core/error/success.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/add_dizi_usecase.dart';
import 'package:dizi_ayraci_v7/features/dizi/presentation/state_management/service/dizi_service.dart';
import 'package:get/get.dart';

class DiziController extends GetxController {
  final diziler = <Dizi>[].obs;

  // final isSuccess = true.obs;
  // final failureMessage = "".obs;

  final responseC = Rxn<Either<Failure, Success>>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchDiziler();
  }

  Future<void> fetchDiziler() async {
    var d = await DiziService().getAllDizi();

    d.fold((l) {
      responseC.value = Left(l);
      print("ddd " + d.toString());
    }, (r) {
      diziler.assignAll(r);
      responseC.value = Right(GetDataSuccess());
    });

    print("ammaa");

    if (!diziler.isEmpty) {
      // 304 hatasi icin // aslinda elimizde datalar oldugu icin Failure degil Success olarak degerlendiriyorz.
      return;
    }

    responseC.value = Left(// error connection hatasi icin
        BilinmeyenHataFailure(failureMessage: "Servera baglanilamadi"));
  }

  Future<Either<Failure, Success>> addDizi(AddDiziParams params) async {
    var resp = await DiziService().addDizi(params);

    return resp;
    // var status = 0;
    // resp.fold((l) {
    //   status = 0;
    //   return Left(l);
    // }, (r) {
    //   status = 1;
    //   return Right(r);
    // });

    // if (status == 0) {
    //   return Left(l);
    // } else {}
  }
}
