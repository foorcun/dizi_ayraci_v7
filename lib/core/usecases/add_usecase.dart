import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failure.dart';

abstract class AddUseCase<Type, Params> {
  Future<Either<Failure, void>> call(Params params);
}
