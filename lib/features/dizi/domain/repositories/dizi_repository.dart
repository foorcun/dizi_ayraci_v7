// # Functional programming thingies
// dartz: 0.10.1

import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failures.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/add_dizi_usecase.dart';

abstract class DiziRepository {
  // Stream<Either<Failure, List<Dizi>>> getAllDiziler(); //Stream kullanacaksak Failure ile çalışMA
  Stream<List<Dizi>> getAllDiziStream();
  Future<List<Dizi>> getAllDiziFuture();

  Future<void> addDizi(AddDiziParams params);

  // Stream<Either<Failure, List<Dizi>>>
  //     getAllByFailureDiziler(); //Stream kullanacaksak Failure ile çalışMA

  // Stream<List<Dizi>> getAllDizilerByUser(String email);

  // Future<Either<Failure, void>> addDiziToUser(AddDiziToUserParams params);
}
