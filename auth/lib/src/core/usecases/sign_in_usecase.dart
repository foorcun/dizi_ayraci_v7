import '../error/failure.dart';
import '../../features/user/data/datasource/auth_strateji.dart';
import 'package:dartz/dartz.dart';

abstract class SignInUser<Type> {
  Future<Either<Failure, Type>> call(AuthStrateji authStrateji);
}
