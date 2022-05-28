import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/get_all_usecase_dizi_future.dart';
import 'package:flutter/cupertino.dart';

import 'package:dizi_ayraci_v7/injection_container.dart' as di;

class PlainDiziler extends StatelessWidget {
  const PlainDiziler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: di.sl<GetAllUseCaseDiziFuture>().call(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot);
          }
          return Container();
        });
  }
}
