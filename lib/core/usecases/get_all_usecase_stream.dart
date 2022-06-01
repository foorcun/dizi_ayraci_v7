import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failure.dart';

abstract class GetAllUseCaseStream<Type> {
  Stream<Either<Failure, List<Type>>> call();
}
