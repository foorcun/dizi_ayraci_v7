import 'package:auth/src/core/error/failure.dart';
import 'package:auth/src/core/error/success.dart';
import 'package:dartz/dartz.dart';

abstract class AddDomainUsecase<Type, Params>  {
    Future<Either<Failure, Success>> call(Params params);
}