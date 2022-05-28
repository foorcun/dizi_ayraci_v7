import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';

abstract class StaticDiziRemoteDataSource {
  Future<List<DiziModel>> getAllDiziler();
}
