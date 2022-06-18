import '../../../../core/error/success.dart';
import '../datasource/auth_strateji.dart';
import '../../domain/entities/BenimUser.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, BenimUser>> signIn(AuthStrateji authStrateji) {
    // TODO: implement signIn
    return authStrateji.signIn(authStrateji);
  }

  @override
  Future<Either<Failure, Success>> signOut(BenimUser benimUser) {
    // TODO: implement signOut
    return benimUser.authStrateji!.signOut();
  }
}
