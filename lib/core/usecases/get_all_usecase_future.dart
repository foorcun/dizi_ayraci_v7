import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failure.dart';

abstract class GetAllUseCaseFuture<Type> {
  Future<Either<Failure, List<Type>>> call();
}
