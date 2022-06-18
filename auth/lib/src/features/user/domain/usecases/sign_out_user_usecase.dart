import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';
import '../../../../core/usecases/sign_out_usecase.dart';
import '../entities/BenimUser.dart';
import '../repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class SignOutUserUsecase implements SignOutUsecase<Success> {
  final UserRepository repository;
  SignOutUserUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, Success>> call(BenimUser benimUser) {
    // TODO: implement call
    return repository.signOut(benimUser);
  }
}
