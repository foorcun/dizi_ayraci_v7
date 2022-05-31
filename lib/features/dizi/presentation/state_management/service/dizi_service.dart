import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/get_all_usecase_dizi_future.dart';

import 'package:dizi_ayraci_v7/injection_container.dart' as di;

class DiziService {
  Future<List<Dizi>> getAllDizi() async {
    return di.sl<GetAllUseCaseDiziFuture>().call();
  }
}
