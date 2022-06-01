// # Functional programming thingies
// dartz: 0.10.1

import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failure.dart';
import 'package:dizi_ayraci_v7/core/error/success.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/add_dizi_usecase.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/delete_dizi_by_id_usecase.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/dizi_update_patch_usecase.dart';

abstract class DiziRepository {
  // Stream<Either<Failure, List<Dizi>>> getAllDiziler(); //Stream kullanacaksak Failure ile çalışMA
  Stream<Either<Failure, List<Dizi>>> getAllDiziStream();
  Future<Either<Failure, List<Dizi>>> getAllDiziFuture();

  Future<Either<Failure, Success>> addDizi(AddDiziParams params);

  Future<Either<Failure, Success>> deleteDiziById(DeleteDiziByIdParams params);

  Future<Either<Failure, Success>> diziUpdatePatch(
      UpdateDiziPatchParams params);

  // Stream<Either<Failure, List<Dizi>>>
  //     getAllByFailureDiziler(); //Stream kullanacaksak Failure ile çalışMA

  // Stream<List<Dizi>> getAllDizilerByUser(String email);

  // Future<Either<Failure, void>> addDiziToUser(AddDiziToUserParams params);
}
