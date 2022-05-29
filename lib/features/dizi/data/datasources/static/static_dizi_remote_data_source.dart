import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/delete_dizi_by_id_usecase.dart';

abstract class StaticDiziRemoteDataSource {
  Future<List<DiziModel>> getAllDiziler();

  Future<void> deleteDiziById(DeleteDiziByIdParams params);
}
