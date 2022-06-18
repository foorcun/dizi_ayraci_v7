import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';
import '../../data/datasource/auth_strateji.dart';
import '../entities/BenimUser.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, BenimUser>> signIn(AuthStrateji authStrateji);
  Future<Either<Failure, Success>> signOut(BenimUser benimUser);
}
