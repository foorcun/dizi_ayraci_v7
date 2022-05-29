import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/delete_dizi_by_id_usecase.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/get_all_usecase_dizi_future.dart';
import 'package:dizi_ayraci_v7/features/sezon/domain/entites/sezon.dart';
import 'package:flutter/cupertino.dart';

import 'package:dizi_ayraci_v7/injection_container.dart' as di;

import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/add_dizi_usecase.dart';

class PlainDiziler extends StatelessWidget {
  const PlainDiziler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: di.sl<GetAllUseCaseDiziFuture>().call(),
        builder: (context, snapshot) {
          //diziEklemece();

          //deleteMethod();

          if (snapshot.hasData) {
            print(snapshot);
          }
          return Container();
        });
  }

  void deleteMethod() {
    try {
      di.sl<DeleteDiziByIdUsecase>().call(DeleteDiziByIdParams(id: 46));
    } catch (e) {
      print(e);
    }
  }

  void diziEklemece() {
    List<Sezon> sezonlar = [];
    sezonlar.add(Sezon(sezonName: "deneme Sezon"));
    var dizim = DiziModel(diziName: "plain ekleme deneme");
    dizim.sezonlar = sezonlar;

    di.sl<AddDiziUsecase>().call(AddDiziParams(eklenecekDizi: dizim));
  }
}
