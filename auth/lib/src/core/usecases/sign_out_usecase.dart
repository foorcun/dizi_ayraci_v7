import '../error/failure.dart';
import '../../features/user/domain/entities/BenimUser.dart';
import 'package:dartz/dartz.dart';

abstract class SignOutUsecase<Type> {
  Future<Either<Failure, Type>> call(BenimUser benimUser);
}
