import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';

abstract class DynamicDiziRemoteDataSource {
  Stream<List<DiziModel>> getAllDiziler();
  // // Future<void> addDizi(DiziParams params);
  // // Future<void> deleteDizi(DeleteDiziParams params);
  // // Future<Dizi> findDizi(FindByIDUseCaseDiziParams params);
  // Stream<List<DiziModel>> getAllByFailureDiziler();

  // Stream<List<DiziModel>> getAllDizilerByUser({required String email});

  // Future<void> addDiziToUser(AddDiziToUserParams params);
}
