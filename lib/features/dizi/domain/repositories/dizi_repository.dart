// # Functional programming thingies
// dartz: 0.10.1

import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failures.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';

abstract class DiziRepository {
  // Stream<Either<Failure, List<Dizi>>> getAllDiziler(); //Stream kullanacaksak Failure ile çalışMA
  Stream<List<Dizi>> getAllDiziStream();

  // Stream<Either<Failure, List<Dizi>>>
  //     getAllByFailureDiziler(); //Stream kullanacaksak Failure ile çalışMA

  // Stream<List<Dizi>> getAllDizilerByUser(String email);

  // Future<Either<Failure, void>> addDiziToUser(AddDiziToUserParams params);
}
