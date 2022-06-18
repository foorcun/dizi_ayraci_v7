import '../../../../core/error/failure.dart';
import '../../../../core/usecases/sign_in_usecase.dart';
import '../../data/datasource/auth_strateji.dart';
import '../entities/BenimUser.dart';
import '../repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUserUsecase implements SignInUser<BenimUser> {
  final UserRepository repository;
  SignInUserUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, BenimUser>> call(AuthStrateji authStrateji) {
    // TODO: implement call
    print('SignInUserUsecase');
    return repository.signIn(authStrateji);
  }
}
