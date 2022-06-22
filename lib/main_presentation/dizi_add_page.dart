import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/presentation/state_management/controller/dizi_controller.dart';
import 'package:dizi_ayraci_v7/features/sezon/domain/entites/sezon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:dizi_ayraci_v7/injection_container.dart' as di;
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/add_dizi_usecase.dart';

class DiziAddPage extends StatelessWidget {
  DiziAddPage({Key? key}) : super(key: key);

  final _diziTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dizi ekle"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: TextField(
              controller: _diziTextController,
            ),
            padding: EdgeInsets.all(32),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () async {
                // await firebase
                //     // .collection("series")
                //     .collection("diziler")
                //     .doc(_diziTextController.text + "-doc")
                //     .set({"diziName": _diziTextController.text});
                print(_diziTextController.text);

                // await diziEklemece(_diziTextController.text);

                var resp = await Get.find<DiziController>().addDizi(
                    AddDiziParams(
                        eklenecekDizi:
                            DiziModel(diziName: _diziTextController.text)));
                resp.fold((l) {
                  print("dizi eklenemedi");
                }, (r) {
                  print("dizi eklendi");
                  Get.toNamed("/DiziListPage");
                });
              },
              child: Text("Kaydet"),
            ),
          ),
        ],
      ),
    );
  }
}

// Future<void> diziEklemece(String dizNa) async {
//   List<Sezon> sezonlar = [];
//   sezonlar.add(Sezon(sezonName: "deneme Sezon"));
//   var dizim = DiziModel(diziName: dizNa);
//   dizim.sezonlar = sezonlar;

//   await di.sl<AddDiziUsecase>().call(AddDiziParams(eklenecekDizi: dizim));
//   await Get.find<DiziController>().fetchDiziler();
// }
